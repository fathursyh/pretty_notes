import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pretty_notes/presentations/pages/landing_page.dart';
import 'package:pretty_notes/src/controllers/app_controller.dart';
import 'package:pretty_notes/src/controllers/auth_controller.dart';
import 'package:pretty_notes/src/setting/page_names.dart';
import 'src/setting/firebase_options.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  // final settingsController = SettingsController(SettingsService());
  final auth = Get.put(AuthController());
  Get.put(AppController());

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

  // // check user state
  FirebaseAuth.instance.userChanges().listen((User? user) {
    if (user == null) {
      auth.isLoggedIn = false;
    } else {
      auth.getUserData(user.uid);
      auth.isLoggedIn = true;
    }
  });

  runApp(
    GetMaterialApp(
      initialRoute: '/splash',
      unknownRoute: GetPage(
        name: '/landing',
        page: () => const LandingPage(),
      ),
      getPages: pages,
      debugShowCheckedModeBanner: false,
    ),
  );
}
