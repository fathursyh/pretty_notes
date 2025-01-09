import 'package:flutter/material.dart';
import 'package:pretty_notes/presentations/widgets/forms/add_note_form.dart';
import 'package:pretty_notes/presentations/widgets/forms/edit_task_form.dart';
import 'package:pretty_notes/src/setting/custom_colors.dart';

class EditPage extends StatelessWidget {
  const EditPage.task(
      {super.key, this.isTask = true, this.index = 0, this.taskId = ''});
  const EditPage.note(
      {super.key, this.isTask = false, this.index = 0, this.taskId = ''});
  final bool isTask;
  final int index;
  final String taskId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Entry'),
        backgroundColor: CustomColors.primary,
      ),
      resizeToAvoidBottomInset: false,
      body: isTask == true ? EditTaskForm(index, taskId) : const AddNoteForm(),
    );
  }
}
