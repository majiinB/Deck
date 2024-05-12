import 'dart:ffi';

import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/task/add_task.dart';
import 'package:deck/pages/task/edit_task.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:deck/pages/task/display_task.dart';

class TaskPage extends StatefulWidget {
 const TaskPage({super.key});
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>{
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;

    });
  }

  List<String> taskTitles = [
    'taskTitle1','taskTitle2','taskTitle3',
        'taskTitle4','taskTitle5','taskTitle6',
    'taskTitle7','taskTitle8','taskTitle9'
  ];
  List<DateTime> deadlines = [
    DateTime(2024, 1, 15), // January 15, 2024
    DateTime(2024, 2, 10), // February 10, 2024
    DateTime(2024, 3, 5),  // March 5, 2024
    DateTime(2024, 4, 20), // April 20, 2024
    DateTime(2024, 5, 12), // May 12, 2024
    DateTime(2024, 6, 30), // June 30, 2024
    DateTime(2024, 7, 8),  // July 8, 2024
    DateTime(2024, 8, 22), // August 22, 2024
    DateTime(2024, 9, 17), // September 17, 2024
  ];
  List<bool> isDone = [
    true, false,true,
    true,false,false,
    true, false,true,
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     floatingActionButton: DeckFAB(
         text: "Add Task",
       icon: Icons.add, //walang plus c deck </3
       foregroundColor: DeckColors.primaryColor,
       backgroundColor: DeckColors.gray,
       onPressed: () {
           // Navigate to the second page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskPage()),
            );
        },
     ),
      body:  Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the second page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DisplayTaskPage()),
            );
          },
          child: Text('SETTINGS TO AH'),
        ),
      ),
      // CustomScrollView(
      //
      //   slivers: [
      //     SliverAppBar(
      //       flexibleSpace: FlexibleSpaceBar(
      //         background:  Container(
      //           color: DeckColors.backgroundColor,
      //           width: double.maxFinite,
      //
      //         ),
      //         collapseMode: CollapseMode.pin,
      //
      //       )
      //     )
      //   ],
      // ),
   );
  }
}

