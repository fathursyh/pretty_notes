import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  // Register
  Future<bool> createUser(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user != null;
    } on FirebaseAuthException catch (e) {
      // print(e);
      e.message;
      return false;
    }
  }

  // Login
  Future<bool> loginUser(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      e.message;
      return false;
    }
  }

  // logout
  void logoutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
