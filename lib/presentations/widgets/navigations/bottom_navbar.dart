import 'package:flutter/material.dart';
import 'package:pretty_notes/src/controller/app_controller.dart';
import 'package:get/get.dart';

class BottomAppCustom extends StatefulWidget {
  const BottomAppCustom({super.key});

  @override
  State<BottomAppCustom> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomAppCustom> {
  final AppController state = Get.put(AppController());
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
      padding: const EdgeInsets.only(bottom: 10, left: 4, right: 4),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        )
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black87,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 207, 235, 69),
          unselectedItemColor: Colors.white60,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
