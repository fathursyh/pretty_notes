import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pretty_notes/presentations/widgets/custom/custom_menu.dart';
import 'package:pretty_notes/presentations/widgets/custom/two_lines_text.dart';
import 'package:pretty_notes/src/controllers/app_controller.dart';

class AllTask extends StatelessWidget {
  const AllTask({super.key});
  @override
  Widget build(BuildContext context) {
    final AppController app = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () {},
                  label: Text(
                    'All Tasks',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  icon: const Icon(Icons.arrow_drop_down),
                ),
                Row(
                  children: [
                    Text(
                      '${app.tasks.length}',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' tasks',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 22,
                child: Checkbox(
                  value: false,
                  onChanged: (bool? value) {},
                ),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.grey[600],
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
                onPressed: () {
                  app.isReversed.value = !app.isReversed.value;
                },
                child: const Icon(Icons.sort),
              )
            ],
          ),
          Flexible(
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: app.tasks.length,
                reverse: app.isReversed.value,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      app.updateTask(index, app.tasks[index]['id_task'],
                          {'isDone': !app.tasks[index]['isDone']});
                      app.tasks.refresh();
                    },
                    onLongPress: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => CustomMenu(
                          index: index,
                          taskId: app.tasks[index]['id_task'],
                        ),
                      );
                    },
                    dense: true,
                    isThreeLine: true,
                    enableFeedback: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.info,
                      color: app.tasks[index]['priority'] == 1
                          ? Colors.green
                          : app.tasks[index]['priority'] == 2
                              ? Colors.orange
                              : Colors.red,
                    ),
                    title: TwoLinesText(
                      '${app.tasks[index]['title']}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    titleAlignment: ListTileTitleAlignment.threeLine,
                    subtitle: TwoLinesText(
                      '${app.tasks[index]['desc']}',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    trailing: !app.tasks[index]['isDone']
                        ? Text(
                            (DateFormat('dd/MM/yyyy').format(DateTime.parse(
                                    app.tasks[index]['deadline'])))
                                .toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          )
                        : Text(
                            "Done",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
