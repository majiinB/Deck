import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deck/backend/auth/auth_service.dart';
import 'package:deck/backend/task/task_provider.dart';
import 'package:deck/backend/task/task_service.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/task/task.dart';
import 'package:provider/provider.dart';

import '../../backend/models/task.dart';

class EditTaskPage extends StatefulWidget {
  final Task task;
  const EditTaskPage({super.key, required this.task});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {

  //initial values
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _dateController;


  @override
  void initState() {
    super.initState();

    _dateController =
        TextEditingController(text: widget.task.deadline.toString().split(" ")[0]);
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController = TextEditingController(text: widget.task.description.toString());
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: widget.task.deadline, //selected date ni user
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldHintText: 'Month/Day/Year',
      fieldLabelText: 'Date Deadline',

      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: const TextTheme(
              titleSmall: TextStyle(
                fontFamily: 'Fraiche',
                fontSize: 20,
              ),
              headlineLarge: TextStyle(
                fontFamily: 'Fraiche',
                fontSize: 40,
              ),
              labelLarge: TextStyle(
                fontFamily: 'Fraiche',
                fontSize: 20,
              ),
              bodyLarge: TextStyle(
                fontFamily: 'nunito',
                fontSize: 16,
              ),
            ),
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  // Title, selected date and day selection background (dark and light mode)
                  surface: DeckColors.backgroundColor,
                  primary: DeckColors.primaryColor,
                  // Title, selected date and month/year picker color (dark and light mode)
                  onSurface: DeckColors.white,
                  onPrimary: DeckColors.white,
                ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontFamily: 'Fraiche',
                  fontSize: 20,
                ),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(50)),
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 20,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      _dateController.text = pickedDate
          .toString()
          .split(" ")[0]; // Update text in the controller with selected date
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DeckBar(
        title: 'Edit Task',
        color: DeckColors.white,
        fontSize: 24,
      ),
      body: SafeArea(
        top: true,
        bottom: false,
        left: true,
        right: true,
        minimum: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          // Add a SingleChildScrollView here
          child: Column(
            children: [
              const Divider(
                color: DeckColors.white,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BuildTextBox(
                  hintText: "Enter Task Title",
                  showPassword: false,
                  controller: _titleController, //initial title
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BuildTextBox(
                  hintText: "Enter Deadline",
                  onTap: () => _selectDate(
                      context), // Pass context to _selectDate method
                  controller: _dateController,
                  isReadOnly: true,
                  rightIcon: Icons.calendar_today_outlined,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BuildTextBox(
                  hintText: "Enter Task Description",
                  showPassword: false,
                  controller: _descriptionController,
                  isMultiLine: true,

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BuildButton(
                    buttonText: "Save",
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    radius: 10,
                    backgroundColor: DeckColors.primaryColor,
                    textColor: DeckColors.white,
                    size: 16,
                    fontSize: 16,
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                    onPressed: () async {
                      if(DateTime.parse(_dateController.text).add(const Duration(hours: 23, minutes: 59, seconds: 59)).isBefore(DateTime.now())){
                        showDialog(context: context, builder: (context) =>
                        const AlertDialog(
                          title: Text("You cannot set the deadline that's already in the past!"),
                        ));
                        return;
                      }

                      final db = FirebaseFirestore.instance;
                      await db.collection('tasks').doc(widget.task.uid).update({
                        'title': _titleController.text,
                        'description': _descriptionController.text,
                        'end_date': DateTime.parse(_dateController.text).add(const Duration(hours: 23, minutes: 59, seconds: 59)),
                      });
                      TaskService().updateTaskFromLoadedTasks(Provider.of<TaskProvider>(context).getList, widget.task);
                      print("save button clicked");
                      Navigator.pop(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => TaskPage()),
                      // );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BuildButton(
                  buttonText: "Cancel",
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  radius: 10,
                  backgroundColor: DeckColors.white,
                  textColor: DeckColors.primaryColor,
                  size: 16,
                  fontSize: 16,
                  borderWidth: 0,
                  borderColor: Colors.transparent,
                  onPressed: () {
                    print("Cancel button clicked");
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
