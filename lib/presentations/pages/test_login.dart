import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_notes/src/controllers/auth_controller.dart';

class TestLogin extends StatelessWidget {
  const TestLogin({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController _state = Get.find();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _state.isLoggedIn = true;
            Get.offNamed('/home');
          },
          child: const Text('LOGIN'),
        ),
      ),
    );
  }
}
