import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  // check user status
  Future<bool> checkUser() async {
    bool status = false;
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        status = false;
      } else {
        status = true;
      }
    });
    return status;
  }

  // Register
  Future<bool> createUser(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      // print(credential.user);
      return credential.user != null;
    } on FirebaseAuthException catch (e) {
      // print(e);
      e.message;
      return false;
    }
  }

  // logout
  void logoutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
