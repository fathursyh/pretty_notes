import 'package:flutter/material.dart';
import 'package:pretty_notes/presentations/widgets/custom/custom_container.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomContainer(
      widgetChild: Center(
        child: Text('Search Page'),
      ),
    );
  }
}
