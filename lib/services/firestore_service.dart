import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:puffpal/services/sqlite_service.dart';

class FirebaseServices{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  LocalDatabase localDb = LocalDatabase();

  //Signs in a user with email and password
  Future<bool> signIn(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  //Signs up a new user with email, password, name, and phone.
  Future<bool> signUp(String emailAddress, String password, String name, String phone, int age, String gender) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password
      );

      await firestore.collection('Users').doc(credential.user!.uid).set({
        'name': name,
        'email': emailAddress,
        'phone': phone,
        'age': age,
        'gender': gender,
        'uid': credential.user!.uid,
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

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return true;
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