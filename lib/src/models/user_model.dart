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
      print(credential.user);
      return credential.user != null;
    } on FirebaseAuthException catch (e) {
      print(e);
      return false;
    }
  }
}
