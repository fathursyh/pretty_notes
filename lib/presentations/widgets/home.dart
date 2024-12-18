import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_notes/presentations/widgets/custom/custom_container2.dart';
import 'package:pretty_notes/src/controllers/app_controller.dart';
import 'package:pretty_notes/src/setting/custom_colors.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AppController app = Get.find();
  @override
  Widget build(BuildContext context) {
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
          CustomContainer2(
            minHeight: 100,
            maxHeight: 280,
            color: CustomColors.primary,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                shrinkWrap: true,
                addAutomaticKeepAlives: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ListTile(
                    minTileHeight: 10,
                    title: Text(
                      'Data Mining ${index + 1}',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: const Text(
                        'Deskripsi tugas ngapain bisa sepanjang ini lah'),
                    trailing: const Icon(
                      Icons.info,
                      color: Colors.green,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          const CustomContainer2(
            color: Colors.amber,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('tes'),
            ),
          )
        ],
      ),
    );
  }
}
