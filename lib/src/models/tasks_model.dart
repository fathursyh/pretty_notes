import 'package:get/get.dart';
import 'package:pretty_notes/src/controllers/auth_controller.dart';
import 'package:pretty_notes/src/models/firebase_realtime.dart';
import 'package:uuid/v4.dart';
// import 'package:uuid/v4.dart';

AuthController auth = Get.find();

class TasksModel {
  static Future<Map> createTask(String title, String desc, DateTime date,
      int priority, bool progress) async {
    final id = const UuidV4().generate();
    final timeStamp = DateTime.now();
    final data = {
      'id_task': id,
      'id_user': auth.id.value,
      'title': title,
      'desc': desc,
      'priority': priority,
      'deadline': date.toIso8601String(),
      'isDone': progress,
      'createdAt': timeStamp.toIso8601String(),
    };
    try {
      FirebaseRealtime.write('users/${auth.id.value}/tasks/$id', data);
      return data;
    } catch (e) {
      e;
      return {};
    }
  }
}
