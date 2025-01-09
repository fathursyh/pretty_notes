import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_notes/presentations/pages/edit_page.dart';
import 'package:pretty_notes/src/controllers/app_controller.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key, this.index = 0, this.taskId = ''});
  final int index;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    AppController app = Get.find();
    return AlertDialog(
      insetPadding: const EdgeInsets.all(0),
      elevation: 10,
      title: Center(
        child: Text(
          '${app.tasks[index]['title']}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PopupMenuDivider(),
          PopupMenuItem(
            onTap: () {
              Get.to(() => EditPage.task(
                    index: index,
                    taskId: taskId,
                  ));
            },
            child: Center(
              child: Text(
                'Edit',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          PopupMenuItem(
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                  insetPadding: const EdgeInsets.all(0),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  title: const Text('Delete task?'),
                  content: Text('${app.tasks[index]['title']}'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        app.deleteTask(index, taskId);
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    ),
                  ]),
            ),
            child: const Center(
              child: Text(
                'Delete',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
