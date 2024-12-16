import 'package:flutter/material.dart';
import 'package:pretty_notes/src/controllers/app_controller.dart';
import 'package:get/get.dart';
import 'package:pretty_notes/src/controllers/auth_controller.dart';

class BottomAppCustom extends StatefulWidget {
  const BottomAppCustom({super.key});

  @override
  State<BottomAppCustom> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomAppCustom> {
  final AppController state = Get.put(AppController());
  final AuthController auth = Get.find();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    state.navigatorIndex(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, left: 6, right: 6),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        )
      ]),
      child: Obx(
        () => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black87,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: auth.userName.value,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color.fromARGB(255, 207, 235, 69),
            unselectedItemColor: Colors.white60,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
