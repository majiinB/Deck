import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/task/add_task.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:intl/date_symbol_data_local.dart';

class TaskPage extends StatefulWidget {
 const TaskPage({super.key});
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>{
  // CalendarController _controller;
  // @override
  // void initState(){
  //   super.initState();
  //   _controller = CalendarController();
  // }
  // @override
  // void dispose(){
  //   super.dispose();
  //   _controller.dispose();
  // }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     floatingActionButton: DeckFAB(
         text: "Add Task",
       fontSize: 12,
       icon: DeckIcons.back_arrow, //walang plus </3
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
     );
  }
}

