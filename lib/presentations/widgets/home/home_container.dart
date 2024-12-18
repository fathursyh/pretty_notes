import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_notes/presentations/widgets/custom/custom_container2.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(this.listData,
      {super.key, this.boxTitle = '', this.boxColor, this.maxHeight = 300});
  final List listData;
  final String boxTitle;
  final Color? boxColor;
  final double maxHeight;
  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      minHeight: 90,
      maxHeight: maxHeight,
      color: boxColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  boxTitle,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: Obx(
                () => ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  addAutomaticKeepAlives: true,
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      minTileHeight: 10,
                      title: Text(
                        '${listData[index]['titles']}',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text('${listData[index]['descriptions']}'),
                      trailing: const Icon(
                        Icons.info,
                        color: Colors.green,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
