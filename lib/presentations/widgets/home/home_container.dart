import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_notes/presentations/widgets/custom/custom_container2.dart';
import 'package:pretty_notes/presentations/widgets/custom/two_lines_text.dart';
import 'package:pretty_notes/src/setting/utilities.dart';

enum ContainerType { hasDeadline, noDeadline }

class HomeContainer extends StatelessWidget {
  const HomeContainer.task(this.listData,
      {super.key,
      this.boxTitle = '',
      this.boxColor,
      this.maxHeight = 300,
      this.type = ContainerType.hasDeadline});
  const HomeContainer.notes(this.listData,
      {super.key,
      this.boxTitle = '',
      this.boxColor,
      this.maxHeight = 300,
      this.type = ContainerType.noDeadline});
  final List listData;
  final String boxTitle;
  final Color? boxColor;
  final double maxHeight;
  final ContainerType type;

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      minHeight: 85,
      maxHeight: maxHeight,
      color: boxColor,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
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
                  shrinkWrap: true,
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      visualDensity: VisualDensity.compact,
                      isThreeLine: true,
                      dense: true,
                      minTileHeight: 10,
                      title: TwoLinesText(
                        '${listData[index]['title']}',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: TwoLinesText(
                        '${listData[index]['desc']}',
                      ),
                      trailing: type == ContainerType.hasDeadline
                          ? Text(
                              Utilities.daysDifference(
                                          listData[index]['deadline']) >
                                      0
                                  ? '${Utilities.daysDifference(listData[index]['deadline'])} days left'
                                  : 'due',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic),
                            )
                          : null,
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
