import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_notes/src/controllers/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    AuthController auth = Get.find();
    auth.checkLoginStatus();
    return auth.isLoggedIn ? null : const RouteSettings(name: '/login');
  }
}
