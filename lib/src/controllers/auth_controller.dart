import 'package:get/get.dart';
import 'package:pretty_notes/presentations/pages/landing_page.dart';
import 'package:pretty_notes/presentations/widgets/custom/custom_snackbar.dart';
import 'package:pretty_notes/src/models/firebase_realtime.dart';
import 'package:pretty_notes/src/models/user_model.dart';
import 'package:uuid/uuid.dart';

class AuthController extends GetxController {
  final model = UserModel();
  final uuid = const Uuid();
  bool isLoggedIn = false;

  void checkLoginStatus() async {
    isLoggedIn = await model.checkUser();
  }

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
      CustomSnackbar('Success', 'Register success!', true);
      return true;
    } else {
      CustomSnackbar('Failed', 'Register failed!', false);
      return false;
    }
  }

  // Logout
  void logoutUser() {
    model.logoutUser();
    Get.offAll(() => const LandingPage());
  }
}
