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

//
// import 'dart:ffi';
//
// import 'package:deck/pages/misc/deck_icons.dart';
// import 'package:deck/pages/task/add_task.dart';
// import 'package:flutter/material.dart';
// import 'package:deck/pages/misc/widget_method.dart';
// import 'package:deck/pages/misc/colors.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// class TaskPage extends StatefulWidget {
//   const TaskPage({super.key});
//   @override
//   _TaskPageState createState() => _TaskPageState();
// }
//
// class _TaskPageState extends State<TaskPage>{
//   DateTime today = DateTime.now();
//
//   void _onDaySelected(DateTime day, DateTime focusedDay){
//     setState(() {
//       today = day;
//
//     });
//   }
//
//   final ScrollController _scrollController = ScrollController();
//   late TextStyle _textStyle = const TextStyle(
//     color: DeckColors.primaryColor,
//     fontFamily: 'Fraiche',
//     fontSize: 40,
//   );
//
//   @override
//   void initState() {
//     super.initState();
//
//     _scrollController.addListener(() {
//       setState(() {
//         // Calculate font size based on scroll position
//         double fontSize = 40 - _scrollController.offset * 0.1; // Adjust the rate of change as needed
//
//         // Ensure font size doesn't go below a minimum value
//         fontSize = fontSize.clamp(40, 60); // Adjust the minimum and maximum font size as needed
//
//         // Update the font size in the TextStyle
//         _textStyle =  TextStyle(
//           color: DeckColors.primaryColor,
//           fontFamily: 'Fraiche',
//           fontSize: fontSize,
//         );
//       });
//     });
//   }
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   List<String> taskTitles = [
//     'taskTitle1','taskTitle2','taskTitle3',
//     'taskTitle4','taskTitle5','taskTitle6',
//     'taskTitle7','taskTitle8','taskTitle9'
//   ];
//   List<DateTime> deadlines = [
//     DateTime(2024, 1, 15), // January 15, 2024
//     DateTime(2024, 2, 10), // February 10, 2024
//     DateTime(2024, 3, 5),  // March 5, 2024
//     DateTime(2024, 4, 20), // April 20, 2024
//     DateTime(2024, 5, 12), // May 12, 2024
//     DateTime(2024, 6, 30), // June 30, 2024
//     DateTime(2024, 7, 8),  // July 8, 2024
//     DateTime(2024, 8, 22), // August 22, 2024
//     DateTime(2024, 9, 17), // September 17, 2024
//   ];
//   List<bool> isDone = [
//     true, false,true,
//     true,false,false,
//     true, false,true,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: DeckFAB(
//         text: "Add Task",
//         icon: Icons.add, //walang plus c deck </3
//         foregroundColor: DeckColors.primaryColor,
//         backgroundColor: DeckColors.gray,
//         onPressed: () {
//           // Navigate to the second page
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AddTaskPage()),
//           );
//         },
//       ),
//       body:   CustomScrollView(
//         controller: _scrollController,
//         slivers: [
//           SliverPersistentHeader(
//             pinned: true,
//             delegate: BuildTabBarDelegate(
//               child: SafeArea(
//                 top: true,
//                 bottom: false,
//                 left: true,
//                 right: true,
//                 minimum: const EdgeInsets.only(top: 20, left: 15, right: 15),
//                 child: Text(
//                   DateFormat('EEEE, MMMM dd').format(),
//                   style: _textStyle,
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: SafeArea(
//               top: true,
//               bottom: false,
//               left: true,
//               right: true,
//               minimum: const EdgeInsets.only(top: 30, left: 15, right: 15),
//               child:
//               Column(
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: DeckColors.coverImageColorSettings,
//                         borderRadius: BorderRadius.circular(20), // Adjust the value as needed
//                       ),
//                       child:
//                       TableCalendar(
//                         focusedDay: today,
//                         firstDay: DateTime.utc(2020,1,1),
//                         lastDay: DateTime.utc(DateTime.now().year + 5, 1 , 1),
//                         onDaySelected: _onDaySelected ,
//                         selectedDayPredicate: (day) => isSameDay(day, today),
//                         rowHeight: 50,
//
//                         calendarStyle: const CalendarStyle(
//                           defaultTextStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           weekNumberTextStyle: TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           weekendTextStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           selectedDecoration: BoxDecoration(
//                             color: DeckColors.primaryColor,
//                             shape: BoxShape.circle,
//                           ),
//                           todayDecoration:  BoxDecoration(
//                             color: Colors.transparent,
//                             shape: BoxShape.circle,
//                           ),
//                           outsideDaysVisible: true,
//                           outsideTextStyle:  TextStyle(
//                             color: DeckColors.gray,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                         ),
//                         headerStyle:
//                         HeaderStyle(
//                           leftChevronIcon: Icon(DeckIcons.back_arrow),
//                           leftChevronMargin: EdgeInsets.zero,
//                           leftChevronPadding: EdgeInsets.only(right: 15),
//                           rightChevronIcon: Transform(
//                             transform: Matrix4.identity()..scale(-1.0, 1.0),
//                             child: Icon(DeckIcons.back_arrow),
//                           ), //niflip ko lng sha >~<
//                           rightChevronMargin: EdgeInsets.zero,
//                           rightChevronPadding: const EdgeInsets.only(right: 60),
//                           formatButtonVisible: false,
//                           titleTextStyle: const TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 28,
//                             fontFamily:  'Fraiche',
//                           ),
//                         ),
//                         daysOfWeekStyle:const DaysOfWeekStyle(
//                           weekdayStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 16,
//                             fontFamily:  'nunito',
//                           ),
//                           weekendStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 16,
//                             fontFamily:  'nunito',
//                           ),
//                         ),
//
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                   ]
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: SafeArea(
//               top: true,
//               bottom: false,
//               left: true,
//               right: true,
//               minimum: const EdgeInsets.only(top: 30, left: 15, right: 15),
//               child:
//               Column(
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: DeckColors.coverImageColorSettings,
//                         borderRadius: BorderRadius.circular(20), // Adjust the value as needed
//                       ),
//                       child:
//                       TableCalendar(
//                         focusedDay: today,
//                         firstDay: DateTime.utc(2020,1,1),
//                         lastDay: DateTime.utc(DateTime.now().year + 5, 1 , 1),
//                         onDaySelected: _onDaySelected ,
//                         selectedDayPredicate: (day) => isSameDay(day, today),
//                         rowHeight: 50,
//
//                         calendarStyle: const CalendarStyle(
//                           defaultTextStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           weekNumberTextStyle: TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           weekendTextStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           selectedDecoration: BoxDecoration(
//                             color: DeckColors.primaryColor,
//                             shape: BoxShape.circle,
//                           ),
//                           todayDecoration:  BoxDecoration(
//                             color: Colors.transparent,
//                             shape: BoxShape.circle,
//                           ),
//                           outsideDaysVisible: true,
//                           outsideTextStyle:  TextStyle(
//                             color: DeckColors.gray,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                         ),
//                         headerStyle:
//                         HeaderStyle(
//                           leftChevronIcon: Icon(DeckIcons.back_arrow),
//                           leftChevronMargin: EdgeInsets.zero,
//                           leftChevronPadding: EdgeInsets.only(right: 15),
//                           rightChevronIcon: Transform(
//                             transform: Matrix4.identity()..scale(-1.0, 1.0),
//                             child: Icon(DeckIcons.back_arrow),
//                           ), //niflip ko lng sha >~<
//                           rightChevronMargin: EdgeInsets.zero,
//                           rightChevronPadding: const EdgeInsets.only(right: 60),
//                           formatButtonVisible: false,
//                           titleTextStyle: const TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 28,
//                             fontFamily:  'Fraiche',
//                           ),
//                         ),
//                         daysOfWeekStyle:const DaysOfWeekStyle(
//                           weekdayStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 16,
//                             fontFamily:  'nunito',
//                           ),
//                           weekendStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 16,
//                             fontFamily:  'nunito',
//                           ),
//                         ),
//
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                   ]
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: SafeArea(
//               top: true,
//               bottom: false,
//               left: true,
//               right: true,
//               minimum: const EdgeInsets.only(top: 30, left: 15, right: 15),
//               child:
//               Column(
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: DeckColors.coverImageColorSettings,
//                         borderRadius: BorderRadius.circular(20), // Adjust the value as needed
//                       ),
//                       child:
//                       TableCalendar(
//                         focusedDay: today,
//                         firstDay: DateTime.utc(2020,1,1),
//                         lastDay: DateTime.utc(DateTime.now().year + 5, 1 , 1),
//                         onDaySelected: _onDaySelected ,
//                         selectedDayPredicate: (day) => isSameDay(day, today),
//                         rowHeight: 50,
//
//                         calendarStyle: const CalendarStyle(
//                           defaultTextStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           weekNumberTextStyle: TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           weekendTextStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           selectedDecoration: BoxDecoration(
//                             color: DeckColors.primaryColor,
//                             shape: BoxShape.circle,
//                           ),
//                           todayDecoration:  BoxDecoration(
//                             color: Colors.transparent,
//                             shape: BoxShape.circle,
//                           ),
//                           outsideDaysVisible: true,
//                           outsideTextStyle:  TextStyle(
//                             color: DeckColors.gray,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                         ),
//                         headerStyle:
//                         HeaderStyle(
//                           leftChevronIcon: Icon(DeckIcons.back_arrow),
//                           leftChevronMargin: EdgeInsets.zero,
//                           leftChevronPadding: EdgeInsets.only(right: 15),
//                           rightChevronIcon: Transform(
//                             transform: Matrix4.identity()..scale(-1.0, 1.0),
//                             child: Icon(DeckIcons.back_arrow),
//                           ), //niflip ko lng sha >~<
//                           rightChevronMargin: EdgeInsets.zero,
//                           rightChevronPadding: const EdgeInsets.only(right: 60),
//                           formatButtonVisible: false,
//                           titleTextStyle: const TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 28,
//                             fontFamily:  'Fraiche',
//                           ),
//                         ),
//                         daysOfWeekStyle:const DaysOfWeekStyle(
//                           weekdayStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 16,
//                             fontFamily:  'nunito',
//                           ),
//                           weekendStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 16,
//                             fontFamily:  'nunito',
//                           ),
//                         ),
//
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                   ]
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: SafeArea(
//               top: true,
//               bottom: false,
//               left: true,
//               right: true,
//               minimum: const EdgeInsets.only(top: 30, left: 15, right: 15),
//               child:
//               Column(
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: DeckColors.coverImageColorSettings,
//                         borderRadius: BorderRadius.circular(20), // Adjust the value as needed
//                       ),
//                       child:
//                       TableCalendar(
//                         focusedDay: today,
//                         firstDay: DateTime.utc(2020,1,1),
//                         lastDay: DateTime.utc(DateTime.now().year + 5, 1 , 1),
//                         onDaySelected: _onDaySelected ,
//                         selectedDayPredicate: (day) => isSameDay(day, today),
//                         rowHeight: 50,
//
//                         calendarStyle: const CalendarStyle(
//                           defaultTextStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           weekNumberTextStyle: TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           weekendTextStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           selectedDecoration: BoxDecoration(
//                             color: DeckColors.primaryColor,
//                             shape: BoxShape.circle,
//                           ),
//                           todayDecoration:  BoxDecoration(
//                             color: Colors.transparent,
//                             shape: BoxShape.circle,
//                           ),
//                           outsideDaysVisible: true,
//                           outsideTextStyle:  TextStyle(
//                             color: DeckColors.gray,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                         ),
//                         headerStyle:
//                         HeaderStyle(
//                           leftChevronIcon: Icon(DeckIcons.back_arrow),
//                           leftChevronMargin: EdgeInsets.zero,
//                           leftChevronPadding: EdgeInsets.only(right: 15),
//                           rightChevronIcon: Transform(
//                             transform: Matrix4.identity()..scale(-1.0, 1.0),
//                             child: Icon(DeckIcons.back_arrow),
//                           ), //niflip ko lng sha >~<
//                           rightChevronMargin: EdgeInsets.zero,
//                           rightChevronPadding: const EdgeInsets.only(right: 60),
//                           formatButtonVisible: false,
//                           titleTextStyle: const TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 28,
//                             fontFamily:  'Fraiche',
//                           ),
//                         ),
//                         daysOfWeekStyle:const DaysOfWeekStyle(
//                           weekdayStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 16,
//                             fontFamily:  'nunito',
//                           ),
//                           weekendStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 16,
//                             fontFamily:  'nunito',
//                           ),
//                         ),
//
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                   ]
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: SafeArea(
//               top: true,
//               bottom: false,
//               left: true,
//               right: true,
//               minimum: const EdgeInsets.only(top: 30, left: 15, right: 15),
//               child:
//               Column(
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: DeckColors.coverImageColorSettings,
//                         borderRadius: BorderRadius.circular(20), // Adjust the value as needed
//                       ),
//                       child:
//                       TableCalendar(
//                         focusedDay: today,
//                         firstDay: DateTime.utc(2020,1,1),
//                         lastDay: DateTime.utc(DateTime.now().year + 5, 1 , 1),
//                         onDaySelected: _onDaySelected ,
//                         selectedDayPredicate: (day) => isSameDay(day, today),
//                         rowHeight: 50,
//
//                         calendarStyle: const CalendarStyle(
//                           defaultTextStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           weekNumberTextStyle: TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           weekendTextStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                           selectedDecoration: BoxDecoration(
//                             color: DeckColors.primaryColor,
//                             shape: BoxShape.circle,
//                           ),
//                           todayDecoration:  BoxDecoration(
//                             color: Colors.transparent,
//                             shape: BoxShape.circle,
//                           ),
//                           outsideDaysVisible: true,
//                           outsideTextStyle:  TextStyle(
//                             color: DeckColors.gray,
//                             fontFamily:  'nunito',
//                             fontSize: 16,
//                           ),
//                         ),
//                         headerStyle:
//                         HeaderStyle(
//                           leftChevronIcon: Icon(DeckIcons.back_arrow),
//                           leftChevronMargin: EdgeInsets.zero,
//                           leftChevronPadding: EdgeInsets.only(right: 15),
//                           rightChevronIcon: Transform(
//                             transform: Matrix4.identity()..scale(-1.0, 1.0),
//                             child: Icon(DeckIcons.back_arrow),
//                           ), //niflip ko lng sha >~<
//                           rightChevronMargin: EdgeInsets.zero,
//                           rightChevronPadding: const EdgeInsets.only(right: 60),
//                           formatButtonVisible: false,
//                           titleTextStyle: const TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 28,
//                             fontFamily:  'Fraiche',
//                           ),
//                         ),
//                         daysOfWeekStyle:const DaysOfWeekStyle(
//                           weekdayStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 16,
//                             fontFamily:  'nunito',
//                           ),
//                           weekendStyle:  TextStyle(
//                             color: DeckColors.white,
//                             fontSize: 16,
//                             fontFamily:  'nunito',
//                           ),
//                         ),
//
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                   ]
//               ),
//             ),
//           ),
//           // SliverPersistentHeader(
//           //
//           //   delegate: BuildTabBarDelegate(
//           //     child: SizedBox(
//           //       width: MediaQuery.of(context).size.width,
//           //       height: MediaQuery.of(context).size.height*0.7, // Adjust the height as needed
//           //       child: BuildTabBar(
//           //         titles: ['All', 'Done'],
//           //         length: 2,
//           //         tabContent: [
//           //
//           //         ],
//           //       ),
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

