import 'package:flutter/material.dart';
import 'package:pretty_notes/presentations/widgets/custom/custom_container.dart';
import 'package:pretty_notes/presentations/widgets/task.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomContainer(
      color: Colors.blue,
      widgetChild: Task(),
    );
  }
}
