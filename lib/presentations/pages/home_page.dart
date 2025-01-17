import 'package:flutter/material.dart';
import 'package:pretty_notes/presentations/widgets/custom/custom_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomContainer(
      widgetChild: Center(
        child: Text('Home'),
      ),
    );
  }
}
