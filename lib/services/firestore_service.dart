import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:puffpal/services/sqlite_service.dart';

import 'firebase_api.dart';
import 'location_service.dart';

class FirebaseServices{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  LocalDatabase localDb = LocalDatabase();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> updateFirebaseUserFieldByEmail(String email, Map<String, dynamic> fieldsToUpdate) async {

    try {
      await firestore.collection('Users').doc(auth.currentUser!.uid).update(fieldsToUpdate);


    } catch (e) {
      throw Exception("Failed to update user field(s) in Firebase.");
    }
  }

  //Signs in a user with email and password
  Future<bool> signIn(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      String? fcmToken = await FirebaseMessaging.instance.getToken();

      await firestore.collection('Users').doc(credential.user!.uid).update({
        'fcmToken': fcmToken,
      });

      try {
        await LocationService().requestAndSaveLocation();
        print('User location updated on sign-in.');
      } catch (e) {
        print('Error updating user location: $e');
      }
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }

  }

  //Signs up a new user with email, password, name, and phone.
  Future<bool> signUp(String emailAddress, String password, String name, String phone, int age, String gender) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password
      );

      String? fcmToken = await FirebaseMessaging.instance.getToken();

      await firestore.collection('Users').doc(credential.user!.uid).set({
        'name': name,
        'email': emailAddress,
        'phone': phone,
        'age': age,
        'gender': gender,
        'uid': credential.user!.uid,
        'fcmToken': fcmToken,
      });

      await localDb.insertUser({
        'name': name,
        'email': emailAddress,
        'password': password,
        'number': int.parse(phone),
        'age': age,
        'gender': gender,
        'firebaseId': credential.user!.uid,
      });

      await FirebaseApi().initNotification();

      try {
        await LocationService().requestAndSaveLocation();
        print('User location saved successfully.');
      } catch (e) {
        print('Failed to get user location: $e');
      }
      return true;


    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }

  }

  //Signs out the currently logged-in user.
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw Exception('Failed to sign out.');
    }
  }
}