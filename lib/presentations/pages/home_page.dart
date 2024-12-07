import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_notes/presentations/widgets/navigations/bottom_navbar.dart';
import 'package:pretty_notes/src/controller/app_controller.dart';
import 'package:get/get.dart';
import 'package:pretty_notes/src/setting/custom_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController state = Get.put(AppController());
    String changePage(RxInt index) {
      String currentWidget = '';
      switch (index.toInt()) {
        case 0:
          currentWidget = 'HomePage';
          break;
        case 1:
          currentWidget = 'Search';
          break;
        case 2:
          currentWidget = 'Notes';
          break;
        case 3:
          currentWidget = 'Profile';
          break;
      }
      return currentWidget;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        title: Center(
          child: Text(
            'Pretty Notes',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Obx(
          () => Text(
            changePage(state.navigator),
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppCustom(),
    );
  }
}
