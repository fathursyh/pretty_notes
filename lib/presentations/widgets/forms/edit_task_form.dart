import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pretty_notes/src/controllers/app_controller.dart';
import 'package:pretty_notes/src/controllers/auth_controller.dart';
import 'package:pretty_notes/src/setting/custom_colors.dart';

class EditTaskForm extends StatefulWidget {
  const EditTaskForm(this.index, this.taskId, {super.key});
  final int index;
  final String taskId;
  @override
  State<EditTaskForm> createState() => _EditTaskFormState();
}

class _EditTaskFormState extends State<EditTaskForm> {
  int? index;
  String? taskId;
  final AppController state = Get.find();
  String _title = '';
  DateTime? _date;
  int _selectedPriority = 3;
  String _desc = '';
  bool _isDone = false;
  final TextEditingController textControl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    index = widget.index;
    taskId = widget.taskId;
    textControl.text = DateFormat.yMEd()
        .format(DateTime.parse(state.tasks[widget.index]['deadline']))
        .toString();
    _selectedPriority = state.tasks[widget.index]['priority'];
    _isDone = state.tasks[widget.index]['isDone'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Edit Task',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            TextFormField(
              initialValue: state.tasks[index!]['title'],
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                label: Text('Title'),
                hintStyle: TextStyle(color: Colors.black38),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Title is required.';
                }
                return null;
              },
              onSaved: (value) {
                _title = value!;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              readOnly: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: textControl,
              onSaved: (value) {
                _date ??= DateTime.parse(state.tasks[index!]['deadline']);
              },
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2026),
                ).then((date) {
                  setState(() {
                    _date = date;
                    textControl.text =
                        DateFormat.yMEd().format(_date!).toString();
                  });
                });
              },
              decoration: InputDecoration(
                label: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('Deadline'),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                hintStyle: const TextStyle(color: Colors.black38),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio<int>(
                    value: 3,
                    groupValue: _selectedPriority,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedPriority = value!;
                      });
                    },
                  ),
                  const Text('Urgent'),
                  Radio<int>(
                    value: 2,
                    groupValue: _selectedPriority,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedPriority = value!;
                      });
                    },
                  ),
                  const Text('Moderate'),
                  Radio<int>(
                    value: 1,
                    groupValue: _selectedPriority,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedPriority = value!;
                      });
                    },
                  ),
                  const Text('Low'),
                ],
              ),
            ),
            TextFormField(
              initialValue: state.tasks[index!]['desc'],
              minLines: 5,
              maxLines: 10,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                label: Text('Description'),
                alignLabelWithHint: true,
                hintStyle: TextStyle(color: Colors.black38),
              ),
              validator: null,
              onSaved: (value) {
                _desc = value!;
              },
            ),
            Row(
              children: [
                Checkbox(
                    value: _isDone,
                    onChanged: (bool? value) {
                      setState(() {
                        _isDone = value!;
                      });
                    }),
                Text(_isDone ? 'Done' : 'On progress'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 38),
                        backgroundColor: CustomColors.primary),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        state.updateTask(index!, taskId!, {
                          'title': _title,
                          'desc': _desc,
                          'priority': _selectedPriority,
                          'deadline': _date?.toIso8601String(),
                          'isDone': _isDone
                        });
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      'Edit',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
