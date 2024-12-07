import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_notes/presentations/pages/home_page.dart';
import 'package:pretty_notes/presentations/pages/profile_page.dart';
import 'package:pretty_notes/presentations/pages/search_page.dart';
import 'package:pretty_notes/presentations/pages/task_page.dart';
import 'package:pretty_notes/presentations/widgets/navigations/bottom_navbar.dart';
import 'package:pretty_notes/src/controllers/app_controller.dart';
import 'package:get/get.dart';
import 'package:pretty_notes/src/setting/custom_colors.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController state = Get.put(AppController());
    Widget currentPage(RxInt index) {
      Widget currentWidget = const HomePage();
      switch (index.toInt()) {
        case 0:
          currentWidget = const HomePage();
          break;
        case 1:
          currentWidget = const SearchPage();
          break;
        case 2:
          currentWidget = const TaskPage();
          break;
        case 3:
          currentWidget = const ProfilePage();
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
            style: GoogleFonts.lobsterTwo(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Obx(
        () => currentPage(state.navigator),
      ),
      bottomNavigationBar: const BottomAppCustom(),
    );
  }
}
