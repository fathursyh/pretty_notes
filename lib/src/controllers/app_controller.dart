import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppController extends GetxController {
  // NAVIGATION
  final _navigator = 0.obs;
  final fullDate = DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now());
  get navigator => _navigator;
  void navigatorIndex(int value) {
    _navigator.value = value;
    update();
  }
}
