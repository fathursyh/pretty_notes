import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // auth login
  String _email = '';
  String _password = '';

  // validator
  var isValidEmail = true.obs;
  var isValidPassword = true.obs;

  set validEmail(value) {
    isValidEmail.value = value;
  }

  set validPassword(value) {
    isValidPassword.value = value;
  }

  set email(String email) {
    _email = email;
  }

  set password(String password) {
    _password = password;
  }

  void validateEmail() {
    if (!_email.contains('@gmail.com') || _email.isEmpty) {
      isValidEmail.value = false;
    }
  }

  bool validateLogin() {
    if (_password.length < 8) {
      Get.snackbar('Login Error', 'Password must be at least 8 characters',
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.only(top: 20),
          borderRadius: 0,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      isValidPassword.value = false;
      return false;
    }
    return true;
  }
}
