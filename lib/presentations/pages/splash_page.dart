import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_notes/presentations/pages/home_page.dart';
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
      () => Get.off(() => const HomePage(), transition: Transition.fade),
    );
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('flutter_logo.png'), // Replace with your logo path
            const SizedBox(height: 20),
            Text(
              'Pretty Notes',
              style: GoogleFonts.lobsterTwo(
                  fontWeight: FontWeight.bold, fontSize: 38),
            ),
          ],
        ),
      ),
    );
  }
}
