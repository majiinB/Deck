// ignore_for_file: deprecated_member_use
import 'package:deck/pages/flashcard/flashcard.dart';
import 'package:deck/pages/home/home.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/settings/account.dart';
import 'package:deck/pages/task/task.dart';
import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deck',
      theme: ThemeData(
        brightness: Brightness.dark,
        // primaryColor: Colors.blue,
        scaffoldBackgroundColor: DeckColors.backgroundColor,
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.nunito(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const MainPage(),
    );
  }
}

/// Main Page
// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final screens = const [
    HomePage(),
    TaskPage(),
    FlashcardPage(),
    AccountPage(),
  ];

  ///  Navbar Icons and Label
  final items = const [
    CurvedNavigationBarItem(
      child: Icon(
        DeckIcons.home,
        color: DeckColors.primaryColor,
      ),
      label: 'Home',
      labelStyle: TextStyle(
        color: DeckColors.white,
        fontWeight: FontWeight.w900,
      ),
    ),
    CurvedNavigationBarItem(
      child: Icon(
        DeckIcons.task,
        color: DeckColors.primaryColor,
      ),
      label: 'Tasks',
      labelStyle: TextStyle(
        color: DeckColors.white,
        fontWeight: FontWeight.w900,
      ),
    ),
    CurvedNavigationBarItem(
      child: Icon(
        DeckIcons.flashcard,
        color: DeckColors.primaryColor,
      ),
      label: 'Flashcards',
      labelStyle: TextStyle(
        color: DeckColors.white,
        fontWeight: FontWeight.w900,
      ),
    ),
    CurvedNavigationBarItem(
      child: Icon(
        DeckIcons.account,
        color: DeckColors.primaryColor,
      ),
      label: 'Account',
      labelStyle: TextStyle(
        color: DeckColors.white,
        fontWeight: FontWeight.w900,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: curvedNavigationBar(),
      ),
    );
  }

  CurvedNavigationBar curvedNavigationBar() {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: DeckColors.accentColor,
      color: DeckColors.accentColor,
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.easeInOut,
      height: 80,
      index: index,
      items: items,
      onTap: (index) => setState(() => this.index = index),
    );
  }
}
