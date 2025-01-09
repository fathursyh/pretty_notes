import 'package:flutter/material.dart';
import 'package:pretty_notes/presentations/widgets/forms/add_note_form.dart';
import 'package:pretty_notes/presentations/widgets/forms/add_task_form.dart';
import 'package:pretty_notes/src/setting/custom_colors.dart';

class AddPage extends StatelessWidget {
  const AddPage.task({super.key, this.isTask = true});
  const AddPage.note({super.key, this.isTask = false});
  final bool isTask;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Entry'),
        backgroundColor: CustomColors.primary,
      ),
      resizeToAvoidBottomInset: false,
      body: isTask == true ? const AddTaskForm() : const AddNoteForm(),
    );
  }
}
