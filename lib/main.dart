import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pretty_notes/presentations/pages/register_page.dart';
import 'package:pretty_notes/src/controllers/auth_controller.dart';
import 'src/setting/firebase_options.dart';
// import 'package:pretty_notes/presentations/pages/landing_page.dart';
// import 'package:pretty_notes/presentations/pages/login_page.dart';
// import 'package:pretty_notes/presentations/pages/register_page.dart';
import 'package:pretty_notes/presentations/pages/splash_page.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  // final settingsController = SettingsController(SettingsService());
  Get.put(AuthController());
  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  // await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    ),
  );
}
