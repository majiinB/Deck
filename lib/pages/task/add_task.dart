
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/widget_method.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {

  TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldHintText: 'Month/Day/Year',
      fieldLabelText: 'Date Deadline',

      initialEntryMode: DatePickerEntryMode.input,
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
              bodyLarge:  TextStyle(
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
                  borderRadius: BorderRadius.circular(50)
            ),
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
      _dateController.text = pickedDate.toString().split(" ")[0]; // Update text in the controller with selected date
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthBar(
        title: 'Add New Task',
        color: DeckColors.white,
        fontSize: 24,
      ),
      body: SafeArea(
        top: true,
        bottom: false,
        left: true,
        right: true,
        minimum: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Divider(
              color: DeckColors.white,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child:BuildTextBox(
                hintText: "Enter Task Title",
                showPassword: false,
                initialValue: "",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: BuildTextBox(
                hintText: "Enter Deadline",
                onTap: () => _selectDate(context), // Pass context to _selectDate method
                controller: _dateController,
                isReadOnly: true,
                rightIcon: Icons.calendar_today_outlined,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child:BuildTextBox(
                  hintText: "Enter Task Description",
                  showPassword: false,

                  initialValue: "",
                  isMultiLine: true,
               ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: BuildButton(
                buttonText: "Save",
                height: 50,
                width: MediaQuery.of(context).size.width,
                radius: 10,
                backgroundColor: DeckColors.primaryColor,
                textColor: DeckColors.white,
                size: 16,
                onPressed: (){
                 print("save button clicked");
                 Navigator.pop(context);
                }
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: BuildButton(
                  buttonText: "Cancel",
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  radius: 10,
                  backgroundColor: DeckColors.white,
                  textColor: DeckColors.primaryColor,
                  size: 16,
                  onPressed: (){
                    print("Cancel button clicked");
                    Navigator.pop(context);
                  }
              ),
            ),
            //BuildButton(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   fontWeight: FontWeight.normal,
            //   buttonText: "Enter Deadline",
            //   height: 50,
            //   width: MediaQuery.of(context).size.width,
            //   radius: 10,
            //   backgroundColor: DeckColors.backgroundColor,
            //   borderColor: DeckColors.white,
            //   textColor: Colors.amber,
            //   size: 16,
            //   rightIcon: Icons.calendar_month_rounded,
            //   iconColor: Colors.amber,
            //   onPressed: () => _showDatePicker(context),
            // ),
          ],
        ),
      ),
    );
  }
}
