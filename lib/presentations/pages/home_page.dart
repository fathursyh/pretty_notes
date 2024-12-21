import 'package:flutter/material.dart';
import 'package:pretty_notes/presentations/widgets/custom/custom_container.dart';
import 'package:pretty_notes/presentations/widgets/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: Colors.white38,
      widgetChild: Home(),
    );
  }
}
