import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextAppbar extends StatelessWidget {
  const TextAppbar(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lobsterTwo(fontWeight: FontWeight.bold, fontSize: 26),
    );
  }
}
