import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_notes/src/controllers/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final AuthController auth = Get.find();
    // redirect to login if user state is log off.
    return auth.isLoggedIn ? null : const RouteSettings(name: '/login');
  }
}
