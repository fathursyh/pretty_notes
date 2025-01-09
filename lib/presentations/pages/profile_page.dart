import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_notes/src/controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController user = Get.find();
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Profile',
            style: GoogleFonts.poppins(fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Full Name',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(user.fullName.value),
          const SizedBox(height: 16.0),
          const Text(
            'Email',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(user.email.value),
          const SizedBox(height: 16.0),
          const Text(
            'Tasks',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Tasks (${app.tasks.length})'),
          const SizedBox(height: 16.0),
          const Text(
            'Notes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Notes (${app.notes.length})'),
        ],
      ),
    );
  }
}
