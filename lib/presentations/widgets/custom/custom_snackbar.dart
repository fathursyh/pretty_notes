import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  CustomSnackbar(title, message, isSuccess) {
    Get.snackbar(
      title,
      message,
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      colorText: Colors.white,
      borderRadius: 0,
      margin: const EdgeInsets.symmetric(horizontal: 0),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
    );
  }
}
