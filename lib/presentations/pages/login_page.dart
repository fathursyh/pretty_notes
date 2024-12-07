import 'package:flutter/material.dart';
import 'package:pretty_notes/src/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:pretty_notes/src/setting/custom_colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key}) {
    initFocusEvent();
  }
  final LoginController _authController = Get.put(LoginController());
  final FocusNode _focusNode = FocusNode();
  initFocusEvent() {
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _authController.validateEmail();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: CustomColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => TextFormField(
                focusNode: _focusNode,
                controller: emailController,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: _authController.isValidEmail.value
                        ? null
                        : 'Enter a valid email.'),
                onTap: () => _authController.validEmail = true,
                onChanged: (value) {
                  _authController.email = value;
                },
              ),
            ),
            Obx(
              () => TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    errorText: _authController.isValidPassword.value
                        ? null
                        : 'Password must be at least 8 characters.'),
                onTap: () => _authController.validPassword = true,
                onChanged: (value) {
                  _authController.password = value;
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_authController.validateLogin()) {
                  print('login');
                } else {
                  print('not login');
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
