import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../task/view_task.dart';
// import 'package:deck/pages/account/account.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Initial values for testing
  String userName  = "Pole Andrei Buendia";
  String greeting = "";


  // List upcomingTask = [
  //   //title, deadline, ischecked
  //  [ 'taskTitle1',DateTime(2024, 5, 14), true],
  //   ['taskTitle2',DateTime(2024, 5, 14),false],
  // ['taskTitle3',DateTime(2024, 5, 15),false]
  // ];
  List recentDeck = [
    //title, deckImageFile()
    ["Flashcard Title 1", ""],
    ["Flashcard Title 2", ""],
    ["Flashcard Title 3", ""],
    ["Flashcard Title 4", ""],
    ["Flashcard Title 5", ""],
    ["A Long Flashcard Title 6", ""],
    ["Flashcard Title 1", ""],
    ["Flashcard Title 2", ""],
    ["Flashcard Title 3", ""],
    ["Flashcard Title 4", ""],
    ["Flashcard Title 5", ""],
    ["A Long Flashcard Title 6", ""],
  ];

  List<String> taskTitles = [
    'taskTitle1','taskTitle2','taskTitle3',
    'a long taskTitle4','a very very very long taskTitle5',
    'taskTitle6','taskTitle7','taskTitle8',
    'a long taskTitl9','a very very very long taskTitle10',
  ];
  List<DateTime> taskDeadlines = [
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 15), // May 14, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 15), // May 12, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 15), // May 14, 2024
    DateTime(2024, 5, 14), // May 14, 2024
    DateTime(2024, 5, 15), // May 12, 2024
  ];
  List<bool> isDone = [
    false, false,false,
    false,false,
    false, false,false,
    false,false
  ];

  DateTime today = DateTime.now();
  DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
  DateTime selectedDay = DateTime.now();

  // void goToPage(int pageIndex) {
  //   setState(() {
  //     index = pageIndex;
  //   });
  // }
  @override
  void initState() {
    super.initState();
    String firstName = userName.isNotEmpty ? userName.split(" ").first : 'User';
    greeting = "hi, ${firstName.isEmpty ? 'User' : firstName}!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
      top: true,
      bottom: false,
      left: true,
      right: true,
      minimum: const EdgeInsets.only(left: 20, right: 20),
        child: CustomScrollView(
          slivers: <Widget>[
            DeckSliverHeader(
                backgroundColor: DeckColors.backgroundColor,
                headerTitle: greeting,
                textStyle: const TextStyle(  color: DeckColors.primaryColor,
                  fontFamily: 'Fraiche',
                  fontSize: 56,
                ),
              isPinned: false,
              max: 100,
              min: 100,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: taskTitles.length,
                    (context, index) {
                  return LayoutBuilder(builder: (context, BoxConstraints constraints){
                    double cardWidth = constraints.maxWidth;
                    return Padding(padding: EdgeInsets.symmetric(vertical: 10),
                    child:  HomeTaskTile(
                      taskName: taskTitles[index],
                      deadline: taskDeadlines[index].toString().split(" ")[0],
                      onPressed: () {
                        print('YOU TOUCHED THE TASK!');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const /*ViewDeckPage*/ ViewTaskPage()),
                        );
                      },
                    ),);
                  });
                }),
            ),
            DeckSliverHeader(
              backgroundColor: DeckColors.backgroundColor,
              headerTitle: "Recently Added",
              textStyle: const TextStyle(  color: DeckColors.white,
                fontFamily: 'Fraiche',
                fontSize: 24,
              ),
              isPinned: false,
              max: 50,
              min: 50,
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                        childCount: recentDeck.length,
                        (context, index) {
                  return LayoutBuilder(builder: (context, BoxConstraints constraints){
                    double cardWidth = constraints.maxWidth;
                    return HomeDeckTile(
                      deckName: recentDeck[index][0],
                      deckColor:DeckColors.gray,
                      cardWidth: cardWidth - 8,
                      onPressed: () {
                        print('U TOUCHED MI DECK!');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const /*ViewDeckPage*/ ViewTaskPage()), /// WALA PALA SAKEN MGA PAGES NI GAB HEHE
                        );
                      },
                    );
                  });
                }),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ))
          ],
        )
        ),
    );
  }
}