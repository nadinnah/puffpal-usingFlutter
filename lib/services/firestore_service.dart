import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:puffpal/services/sqlite_service.dart';

import 'firebase_api.dart';
import 'location_service.dart';

class FirebaseServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final LocalDatabase localDb = LocalDatabase();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> updateFirebaseUserFieldByEmail(
      String email,
      Map<String, dynamic> fieldsToUpdate,
      ) async {
    try {
      await firestore
          .collection('Users')
          .doc(auth.currentUser!.uid)
          .update(fieldsToUpdate);
    } catch (e) {
      throw Exception("Failed to update user field(s) in Firebase.");
    }
  }

  Future<bool> signIn(BuildContext context, String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      DocumentSnapshot userDoc = await firestore
          .collection('Users')
          .doc(credential.user!.uid)
          .get();

      if (userDoc.exists) {
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;

        await localDb.insertUser({
          'name': data['name'],
          'email': data['email'],
          'password': password,
          'number': data['phone'],
          'age': data['age'],
          'gender': data['gender'],
          'firebaseId': credential.user!.uid,
        });
      }
      String? fcmToken = await FirebaseMessaging.instance.getToken();

      await firestore.collection('Users').doc(credential.user!.uid).update({
        'fcmToken': fcmToken,
      });

      try {
        await LocationService().requestAndSaveLocation();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User location updated on sign-in.')),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error updating user location: $e')),
          );
        }
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isLoggedIn", true);

      return true;
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('The password provided is too weak.')),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('The account already exists for that email.')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Authentication error: ${e.message}')),
          );
        }
      }
      return false;
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $e')),
        );
      }
      return false;
    }
  }

  Future<bool> signUp({
    required String emailAddress,
    required String password,
    required String name,
    required String phone,
    required int age,
    required String gender,
  }) async {
    try {
      // 1. Create User in Firebase Auth
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      // 2. Fetch FCM Notification Token
      String? fcmToken;
      try {
        fcmToken = await FirebaseMessaging.instance.getToken();
      } catch (e) {
        debugPrint('Failed to get FCM Token: $e');
      }

      // 3. Save to Firestore
      await firestore.collection('Users').doc(credential.user!.uid).set({
        'name': name,
        'email': emailAddress,
        'phone': phone,
        'age': age,
        'gender': gender,
        'uid': credential.user!.uid,
        'fcmToken': fcmToken,
      });

      // 4. Save to Local SQLite DB
      await localDb.insertUser({
        'name': name,
        'email': emailAddress,
        'password': password,
        'number': int.parse(phone),
        'age': age,
        'gender': gender,
        'firebaseId': credential.user!.uid,
      });

      // 5. Initialize Notification Configurations
      await FirebaseApi().initNotification();

      // 6. Handle Background Location Data
      try {
        await LocationService().requestAndSaveLocation();
      } catch (e) {
        debugPrint('Failed to fetch user location silently: $e');
      }

      // 7. Persist local Session State
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isLoggedIn", true);

      return true;
    } on FirebaseAuthException catch (e) {
      // Catch Registration-specific error codes
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('This email is already registered.');
      } else if (e.code == 'invalid-email') {
        throw Exception('The email address format is invalid.');
      } else {
        throw Exception(e.message ?? 'An unknown registration error occurred.');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred during signup: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isLoggedIn", false);
    } catch (e) {
      throw Exception('Failed to sign out.');
    }
  }
}