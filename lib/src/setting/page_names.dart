import 'package:get/get.dart';
import 'package:pretty_notes/presentations/layouts/main_layout.dart';
import 'package:pretty_notes/presentations/pages/landing_page.dart';
import 'package:pretty_notes/presentations/pages/login_page.dart';
import 'package:pretty_notes/presentations/pages/register_page.dart';
import 'package:pretty_notes/presentations/pages/splash_page.dart';
import 'package:pretty_notes/presentations/pages/test_login.dart';
import 'package:pretty_notes/src/middlewares/auth_middleware.dart';

var pages = [
  GetPage(
    name: '/test',
    page: () => const TestLogin(),
  ),
  GetPage(
    name: '/splash',
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: '/landing',
    transition: Transition.downToUp,
    page: () => const LandingPage(),
  ),
  GetPage(
    name: '/',
    page: () => MainLayout(),
  ),
  GetPage(
    name: '/login',
    page: () => const LoginPage(),
  ),
  GetPage(
    name: '/register',
    page: () => const RegisterPage(),
  ),
  GetPage(
    name: '/home',
    page: () => MainLayout(),
    middlewares: [
      AuthMiddleware(),
    ],
  ),
];
