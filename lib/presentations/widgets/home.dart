import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_notes/presentations/widgets/home/home_container.dart';
import 'package:pretty_notes/src/controllers/app_controller.dart';
import 'package:pretty_notes/src/setting/custom_colors.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AppController app = Get.find();
  @override
  Widget build(BuildContext context) {
    final AppController app = Get.find();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            app.fullDate.split(',')[0],
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(app.fullDate.split(',')[1]),
          const SizedBox(height: 10),
          HomeContainer(
            app.tasks,
            boxTitle: 'This Week',
            boxColor: CustomColors.primary,
          ),
          const SizedBox(height: 20),
          InkWell(
            onDoubleTap: () {
              app.showJournal();
            },
            child: Obx(
              () => HomeContainer(
                app.notes,
                boxTitle: 'Notes',
                boxColor: Colors.amber,
                maxHeight: app.isNotesShown.value ? 220 : 90,
              ),
            ),
          )
        ],
      ),
    );
  }
}
