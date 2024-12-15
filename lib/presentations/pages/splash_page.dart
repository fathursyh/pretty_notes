import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:pretty_notes/src/setting/custom_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 4),
      () => Get.offNamed('/landing'),
    );
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
                'assets/flutter_logo.png'), // Replace with your logo path
            const SizedBox(height: 20),
            Text(
              'Notes Kami',
              style: GoogleFonts.lobsterTwo(
                  fontWeight: FontWeight.bold, fontSize: 38),
            ),
          ],
        ),
      ),
    );
  }
}
