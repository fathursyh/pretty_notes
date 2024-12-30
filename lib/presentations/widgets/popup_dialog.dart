import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_notes/presentations/pages/add_page.dart';

class PopUpDialog extends StatelessWidget {
  const PopUpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(0),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: const Text('Create New'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.to(
                () => AddPage.task(),
              );
            },
            child: Text(
              'Tasks',
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.to(() => AddPage.note());
            },
            child: Text(
              'Notes',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
