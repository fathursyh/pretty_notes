import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pretty_notes/src/controllers/auth_controller.dart';
// import 'package:pretty_notes/src/models/firebase_realtime.dart';

class TestLogin extends StatelessWidget {
  const TestLogin({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthController _state = Get.find();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {},
          child: const Text('LOGIN'),
        ),
      ),
    );
  }
}
