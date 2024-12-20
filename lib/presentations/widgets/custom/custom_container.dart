import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key, this.widgetChild, this.color = Colors.white});
  final Widget? widgetChild;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: widgetChild,
    );
  }
}
