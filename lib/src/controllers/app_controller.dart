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

  final isNotesShown = true.obs;
  void showJournal() {
    isNotesShown.value = !isNotesShown.value;
  }

  final tasks = [
    {
      'titles': 'Tugas Teksim',
      'descriptions': 'bikin iThink yang banyak.',
    },
  ].obs;
  final notes = [
    {
      'titles': 'hey',
      'descriptions': '2/12/24',
    }
  ].obs;
}
