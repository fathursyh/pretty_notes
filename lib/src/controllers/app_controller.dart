import 'package:get/get.dart';

class AppController extends GetxController {
  // NAVIGATION
  final _navigator = 0.obs;
  get navigator => _navigator;
  void navigatorIndex(int value) {
    _navigator.value = value;
    update();
  }
}
