import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pretty_notes/presentations/widgets/custom/custom_snackbar.dart';
import 'package:pretty_notes/src/models/firebase_realtime.dart';
import 'package:pretty_notes/src/models/user_model.dart';
import 'package:uuid/uuid.dart';

class AuthController extends GetxController {
  final model = UserModel();
  final uuid = const Uuid();
  String userName = '';
  bool isLoggedIn = false;

  void changeUsername(String value) async {
    final data = await FirebaseRealtime.readOnce('users/$value');
    print(data);
    userName = 'keren';
  }

  // Register
  void registerUser(
      String emailAddress, String fullname, String password) async {
    String id = '';
    final user = await model.createUser(emailAddress, password);
    if (user == true) {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          id = user.uid;
        }
      });
      FirebaseRealtime.write("users/$id", {
        "email": emailAddress,
        "fullname": fullname,
      });
      CustomSnackbar('Success', 'Register success!', true);
      login(emailAddress, password);
    } else {
      CustomSnackbar('Failed', 'Register failed!', false);
    }
  }

  // Login
  Future<bool> login(String email, String password) async {
    final login = await model.loginUser(email, password);
    return login ? true : false;
  }

  // Logout
  void logoutUser() {
    model.logoutUser();
    Get.offAllNamed('/landing');
  }
}
