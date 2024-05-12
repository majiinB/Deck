import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/task/add_task.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

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
     body:   SingleChildScrollView(
       child: SafeArea(
         top: true,
         bottom: false,
         left: true,
         right: true,
         minimum: EdgeInsets.only(top: 60, left: 15, right: 15),
         child:
         Column(
             children: [
               Align(
                 alignment: Alignment.centerLeft,
                 child: Text(
                   DateFormat('EEEE, MMMM dd').format(today),
                   style: TextStyle(
                     color: DeckColors.primaryColor,
                     fontFamily: 'Fraiche',
                     fontSize: 40,
                   ),
                 ),
               ),
               SizedBox(
                 height: 20,
               ),
               Container(
                 padding: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   color: DeckColors.coverImageColorSettings,
                   borderRadius: BorderRadius.circular(20), // Adjust the value as needed
                 ),
                 child:
                 TableCalendar(
                   focusedDay: today,
                   firstDay: DateTime.utc(2020,1,1),
                   lastDay: DateTime.utc(DateTime.now().year + 5, 1 , 1),
                   onDaySelected: _onDaySelected ,
                   selectedDayPredicate: (day) => isSameDay(day, today),
                   rowHeight: 50,

                   calendarStyle: CalendarStyle(
                     defaultTextStyle:  TextStyle(
                       color: DeckColors.white,
                       fontFamily:  'nunito',
                       fontSize: 16,
                     ),
                     weekNumberTextStyle: TextStyle(
                       color: DeckColors.white,
                       fontFamily:  'nunito',
                       fontSize: 16,
                     ),
                     weekendTextStyle:  TextStyle(
                       color: DeckColors.white,
                       fontFamily:  'nunito',
                       fontSize: 16,
                     ),
                     selectedDecoration: BoxDecoration(
                       color: DeckColors.primaryColor,
                       shape: BoxShape.circle,
                     ),
                     todayDecoration:  BoxDecoration(
                       color: Colors.transparent,
                       shape: BoxShape.circle,
                     ),
                     outsideDaysVisible: true,
                     outsideTextStyle:  TextStyle(
                       color: DeckColors.gray,
                       fontFamily:  'nunito',
                       fontSize: 16,
                     ),

                   ),
                   headerStyle:
                   HeaderStyle(
                     leftChevronIcon: Icon(DeckIcons.back_arrow),
                     leftChevronMargin: EdgeInsets.zero,
                     leftChevronPadding: EdgeInsets.only(right: 15),
                     rightChevronIcon: Transform(
                       transform: Matrix4.identity()..scale(-1.0, 1.0),
                       child: Icon(DeckIcons.back_arrow),
                     ), //niflip ko lng sha >~<
                     rightChevronMargin: EdgeInsets.zero,
                     rightChevronPadding:EdgeInsets.only(right: 60),
                     formatButtonVisible: false,
                     titleTextStyle: TextStyle(
                       color: DeckColors.white,
                       fontSize: 28,
                       fontFamily:  'Fraiche',
                     ),
                   ),
                   daysOfWeekStyle:
                   DaysOfWeekStyle(
                     weekdayStyle: TextStyle(
                       color: DeckColors.white,
                       fontSize: 16,
                       fontFamily:  'nunito',
                     ),
                     weekendStyle:  TextStyle(
                       color: DeckColors.white,
                       fontSize: 16,
                       fontFamily:  'nunito',
                     ),
                   ),

                 ),
               ),
               SizedBox(
                 height: 20,
               ),


             ]
         ),
       ),
     ),
     );
  }
}

