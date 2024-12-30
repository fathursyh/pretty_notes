import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_notes/presentations/widgets/custom/two_lines_text.dart';

class AllTask extends StatelessWidget {
  const AllTask({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   'All Tasks',
                //   style: GoogleFonts.poppins(
                //     color: Colors.black,
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
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
                      '8',
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
                onPressed: () {},
                child: const Icon(Icons.sort),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  dense: true,
                  isThreeLine: true,
                  enableFeedback: true,
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.info,
                    color: Colors.green,
                  ),
                  title: TwoLinesText(
                    'judul tugas panjang ini',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  titleAlignment: ListTileTitleAlignment.threeLine,
                  subtitle: TwoLinesText(
                    'Mengerjakan tugas iThink sistem dinamis haha tapi kalo sepanjang ini gimana liat aja.',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  trailing: Text(
                    '12/12/24',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
