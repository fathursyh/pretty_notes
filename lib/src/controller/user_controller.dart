import 'package:get/get.dart';

class UserController extends GetxController {
  String _username = 'username';
  String get username => _username;
  set username(String value) {
    _username = value;
    update();
  }
}
