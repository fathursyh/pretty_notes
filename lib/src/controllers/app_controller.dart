import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pretty_notes/presentations/pages/home_page.dart';
import 'package:pretty_notes/presentations/widgets/custom/custom_snackbar.dart';
import 'package:pretty_notes/src/controllers/auth_controller.dart';
import 'package:pretty_notes/src/models/tasks_model.dart';

AuthController auth = Get.find();

class AppController extends GetxController {
  // NAVIGATION
  Widget currentWidget = const HomePage();
  final _navigator = 0.obs;
  dynamic randomData;
  get navigator => _navigator;
  void navigatorIndex(int value) {
    _navigator.value = value;
    update();
  }

  final pageState = 1.0.obs;

  void showPage() {
    pageState.value = 0.0;
    Timer(const Duration(milliseconds: 80), () {
      pageState.value = 1.0;
    });
  }

  // mainApp key
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // DATE
  final fullDate = DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now());
  final isNotesShown = false.obs;
  void showJournal() {
    isNotesShown.value = !isNotesShown.value;
  }

  bool isSorted = false;
  void sortTask() {
    app.tasks.sort((a, b) {
      final dateA = DateTime.parse(a['deadline']);
      final dateB = DateTime.parse(b['deadline']);
      return dateA.compareTo(dateB);
    });
    isSorted = true;
  }

  final tasks = [].obs;
  final weekTasks = [].obs;
  void getWeektasks() {
    weekTasks.value = tasks;
  }

  final notes = [].obs;

  final isReversed = false.obs;

  void newNote(String title, String desc, DateTime date, int priority,
      bool progress) async {
    final Map write =
        await TasksModel.createTask(title, desc, date, priority, progress);
    if (write.isNotEmpty) {
      CustomSnackbar('Task', 'Task has been created successfuly.', true);
      tasks.add(write);
      sortTask();
      getWeektasks();
    }
  }

  void updateTask(int index, String id, Map<String, Object> data) async {
    final task = FirebaseDatabase.instance.ref('users/${auth.id}/tasks/$id');
    task.update(data);
    data.forEach((key, value) => tasks[index][key] = value);
    getWeektasks();
  }

  void deleteTask(int index, String id) async {
    final task = FirebaseDatabase.instance.ref('users/${auth.id}/tasks/$id');
    await task.remove();
    tasks.removeAt(index);
  }
}
