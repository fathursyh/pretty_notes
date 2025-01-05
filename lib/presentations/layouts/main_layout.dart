import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pretty_notes/presentations/pages/home_page.dart';
import 'package:pretty_notes/presentations/pages/profile_page.dart';
import 'package:pretty_notes/presentations/pages/search_page.dart';
import 'package:pretty_notes/presentations/pages/task_page.dart';
import 'package:pretty_notes/presentations/widgets/custom/notification_drawer.dart';
import 'package:pretty_notes/presentations/widgets/navigations/bottom_navbar.dart';
import 'package:pretty_notes/presentations/widgets/popup_dialog.dart';
import 'package:pretty_notes/src/controllers/app_controller.dart';
import 'package:get/get.dart';
import 'package:pretty_notes/src/setting/custom_colors.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController state = Get.put(AppController());
    Widget currentWidget = const HomePage();
    Widget currentPage(RxInt index) {
      switch (index.toInt()) {
        case 0:
          Timer(const Duration(milliseconds: 20), () {
            currentWidget = const HomePage();
          });
          break;
        case 1:
          Timer(const Duration(milliseconds: 20), () {
            currentWidget = const SearchPage();
          });
          break;
        case 2:
          Timer(const Duration(milliseconds: 20), () {
            currentWidget = const TaskPage();
          });
          break;
        case 3:
          Timer(const Duration(milliseconds: 20), () {
            currentWidget = const ProfilePage();
          });
          break;
      }
      return currentWidget;
    }

    return Scaffold(
      key: state.scaffoldKey,
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 54,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: IconButton(
              onPressed: () {
                state.scaffoldKey.currentState?.openEndDrawer();
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.black87,
                size: 26,
              ),
            ),
          ),
        ],
      ),
      endDrawer: const NotificationDrawer(),
      body: Obx(
        () => AnimatedOpacity(
          curve: Curves.ease,
          opacity: state.pageState.value,
          duration: const Duration(milliseconds: 300),
          child: currentPage(state.navigator),
        ),
      ),
      bottomNavigationBar: const BottomAppCustom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.primary,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => const PopUpDialog(),
          );
        },
      ),
    );
  }
}
