import 'package:flutter/material.dart';

class TwoLinesText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextDirection? textDirection;

  const TwoLinesText(
    this.text, {
    this.style,
    this.textAlign = TextAlign.start,
    this.textDirection,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
