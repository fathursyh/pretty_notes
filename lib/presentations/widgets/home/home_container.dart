import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_notes/presentations/widgets/custom/custom_container2.dart';
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
                      trailing: type == ContainerType.hasDeadline
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  Utilities.daysDifference(
                                              listData[index]['date']) >
                                          0
                                      ? '${Utilities.daysDifference(listData[index]['date'])} days left'
                                      : 'due',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Icon(
                                  Icons.info,
                                  color: Utilities.daysDifference(
                                              listData[index]['date']) <
                                          3
                                      ? Colors.red
                                      : Utilities.daysDifference(
                                                  listData[index]['date']) <
                                              5
                                          ? Colors.orange
                                          : Colors.green,
                                ),
                              ],
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
