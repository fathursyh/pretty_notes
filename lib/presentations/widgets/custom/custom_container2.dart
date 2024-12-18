import 'package:flutter/material.dart';

class CustomContainer2 extends StatelessWidget {
  const CustomContainer2(
      {super.key,
      this.child,
      this.color,
      this.minHeight = 100,
      this.maxHeight = 300});
  final Widget? child;
  final double minHeight;
  final double maxHeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: MediaQuery.of(context).size.width / 1.1,
        constraints: BoxConstraints(
          minHeight: minHeight,
          maxHeight: maxHeight,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          color: color,
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 6),
          ],
        ),
        child: child);
  }
}
