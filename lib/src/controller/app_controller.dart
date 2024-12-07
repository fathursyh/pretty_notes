import 'package:get/get.dart';

class AppController extends GetxController {
  // USERNAME
  String _username = 'username';
  String get username => _username;
  set username(String value) {
    _username = value;
    update();
  }

  // NAVIGATION
  final _navigator = 0.obs;
  get navigator => _navigator;
  void navigatorIndex(int value) {
    _navigator.value = value;
    update();
  }
}
