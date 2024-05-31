import 'package:deck/backend/models/task.dart';
import 'package:deck/backend/task/task_service.dart';
import 'package:deck/pages/flashcard/view_deck.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../backend/auth/auth_service.dart';
import '../../backend/flashcard/flashcard_service.dart';
import '../../backend/models/deck.dart';
import '../task/view_task.dart';
// import 'package:deck/pages/account/account.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  final FlashcardService _flashcardService = FlashcardService();
  Deck? _latestDeck;
  List<Task> _tasks = [];
  List<Deck> _decks = [];
  late User? _user;
  //Initial values for testing
  String greeting = "";


  // List upcomingTask = [
  //   //title, deadline, ischecked
  //  [ 'taskTitle1',DateTime(2024, 5, 14), true],
  //   ['taskTitle2',DateTime(2024, 5, 14),false],
  // ['taskTitle3',DateTime(2024, 5, 15),false]
  // ];

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
    _user = _authService.getCurrentUser();
    _initUserDecks(_user);
    _initUserTasks(_user);
    String? firstName = _user!.displayName!.isNotEmpty ? _user?.displayName?.split(" ").first : 'User';
    greeting = "hi, ${firstName!.isEmpty ? 'User' : firstName}!";
  }

  void _initUserDecks(User? user) async {
    if (user != null) {
      String userId = user.uid;
      List<Deck> decks = await _flashcardService.getDecksByUserIdNewestFirst(userId); // Call method to fetch decks
      setState(() {
        _decks = decks; // Update state with fetched decks
      });
    }
  }

  void _initUserTasks(User? user) async {
    if (user == null) return;
    List<Task> tasks = await TaskService().getTasksOnSpecificDate();
    setState(() {
      _tasks = tasks;
    });
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
                childCount: _tasks.length,
                    (context, index) {
                  return LayoutBuilder(builder: (context, BoxConstraints constraints){
                    double cardWidth = constraints.maxWidth;
                    return Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                    child:  HomeTaskTile(
                      taskName: _tasks[index].title,
                      deadline: _tasks[index].deadline.toString().split(" ")[0],
                      onPressed: () {
                        print('YOU TOUCHED THE TASK!');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => /*ViewDeckPage*/ ViewTaskPage(task: _tasks[index],)),
                        );
                      },
                    ),);
                  });
                }),
            ),
            const DeckSliverHeader(
              backgroundColor: DeckColors.backgroundColor,
              headerTitle: "Recently Added",
              textStyle: TextStyle(  color: DeckColors.white,
                fontFamily: 'Fraiche',
                fontSize: 24,
              ),
              isPinned: false,
              max: 50,
              min: 50,
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                        childCount: _decks.length,
                        (context, index) {
                  return LayoutBuilder(builder: (context, BoxConstraints constraints){
                    double cardWidth = constraints.maxWidth;
                    return HomeDeckTile(
                      deckName: _decks[index].title.toString(),
                      deckImageUrl: _decks[index].coverPhoto.toString(),
                      deckColor:DeckColors.gray,
                      cardWidth: cardWidth - 8,
                      onPressed: () {
                        print('U TOUCHED MI DECK!');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ViewDeckPage(deck: _decks[index])), /// WALA PALA SAKEN MGA PAGES NI GAB HEHE
                        );
                      },
                    );
                  });
                }),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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