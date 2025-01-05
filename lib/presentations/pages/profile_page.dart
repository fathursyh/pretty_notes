import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_notes/src/controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController user = Get.find();
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(user.fullName.value),
          SizedBox(height: 16.0),
          Text(
            'Email',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(user.email.value),
          SizedBox(height: 16.0),
          Text(
            'Tasks',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Tasks(4)'),
          SizedBox(height: 16.0),
          Text(
            'Notes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Notes(19)'),
        ],
      ),
    );
  }
}
