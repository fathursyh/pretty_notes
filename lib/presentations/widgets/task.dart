import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Tasks',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '8',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' tasks',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, offset: Offset(4, 4), blurRadius: 4),
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(-4, -4),
                    blurRadius: 4)
              ],
              border: Border.all(
                color: Colors.black54,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(child: Text('Widget 1')),
          ),
          Text('Widget 2'),
          Text('Widget 3'),
        ],
      ),
    );
  }
}
