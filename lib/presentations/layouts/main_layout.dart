import 'package:flutter/material.dart';
import 'package:pretty_notes/presentations/pages/home_page.dart';
import 'package:pretty_notes/presentations/pages/profile_page.dart';
import 'package:pretty_notes/presentations/pages/search_page.dart';
import 'package:pretty_notes/presentations/pages/task_page.dart';
import 'package:pretty_notes/presentations/widgets/custom/notification_drawer.dart';
import 'package:pretty_notes/presentations/widgets/custom/text_appbar.dart';
import 'package:pretty_notes/presentations/widgets/navigations/bottom_navbar.dart';
import 'package:pretty_notes/src/controllers/app_controller.dart';
import 'package:get/get.dart';
import 'package:pretty_notes/src/setting/custom_colors.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});
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

  @override
  Widget build(BuildContext context) {
    final AppController state = Get.put(AppController());
    return Scaffold(
      key: state.scaffoldKey,
      appBar: AppBar(
        backgroundColor: CustomColors.primary,
        toolbarHeight: 76,
        titleSpacing: 8,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            'assets/flutter_logo.png',
          ),
        ),
        leadingWidth: 50,
        title: const TextAppbar('Notes Kami'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: IconButton(
              onPressed: () {
                state.scaffoldKey.currentState?.openEndDrawer();
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      endDrawer: const NotificationDrawer(),
      body: Obx(
        () => currentPage(state.navigator),
      ),
      bottomNavigationBar: const BottomAppCustom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.primary,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
        onPressed: () {
          state.tasks.add(
            {
              'titles': 'Tugas Boldson',
              'descriptions': 'Test software buatan sendiri.',
              'date': DateTime.utc(2024, 12, 29)
            },
          );
        },
      ),
    );
  }
}
