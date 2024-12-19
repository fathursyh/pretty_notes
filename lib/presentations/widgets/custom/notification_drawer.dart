import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationDrawer extends StatelessWidget {
  const NotificationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: Border.all(style: BorderStyle.none),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DrawerHeader(
              duration: Durations.short1,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.notifications, color: Colors.amber),
                    const SizedBox(width: 10),
                    Text(
                      'Notifications',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.notifications, color: Colors.amber),
                  ],
                ),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.all(24),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ));
  }
}
