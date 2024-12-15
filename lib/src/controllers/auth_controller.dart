import 'package:get/get.dart';
import 'package:pretty_notes/presentations/pages/landing_page.dart';
import 'package:pretty_notes/src/models/firebase_realtime.dart';
import 'package:pretty_notes/src/models/user_model.dart';
import 'package:uuid/uuid.dart';

class AuthController extends GetxController {
  final model = UserModel();
  final uuid = const Uuid();
  
  // Register
  Future<bool> registerUser(
      String emailAddress, String fullname, String password) async {
    String id = uuid.v4();
    final user = await model.createUser(emailAddress, password);
    if (user == true) {
      FirebaseRealtime.write("users/$id", {
        "email": emailAddress,
        "fullname": fullname,
      });
      Get.snackbar('Register', 'Registration Success.');
      return true;
    } else {
      Get.snackbar('Register', 'Registration failed');
      return false;
    }
  }

  // Logout
  void logoutUser() {
    model.logoutUser();
    Get.offAll(() => const LandingPage());
  }
}
