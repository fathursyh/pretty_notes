import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppController extends GetxController {
  // NAVIGATION
  final _navigator = 0.obs;
  get navigator => _navigator;
  void navigatorIndex(int value) {
    _navigator.value = value;
    update();
  }
  // mainApp key
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // DATE
  final fullDate = DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now());

  final isNotesShown = true.obs;
  void showJournal() {
    isNotesShown.value = !isNotesShown.value;
  }

  final tasks = [].obs;
  final notes = [
    {
      'titles': 'hey',
      'descriptions': '2/12/24',
      'date': DateTime.utc(2024, 12, 18)
    }
  ].obs;
}
