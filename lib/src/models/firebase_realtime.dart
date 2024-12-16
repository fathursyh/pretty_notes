import 'package:firebase_database/firebase_database.dart';

class FirebaseRealtime {
  static void write(String doc, Map data) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(doc);
    await ref.set(data);
  }

  static Future<Map> readOnce(String doc) async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child(doc).get();
    if (snapshot.exists) {
      final data = (snapshot.value) as Map;
      return data;
    } else {
      return {};
    }
  }
}
