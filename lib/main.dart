// ignore_for_file: deprecated_member_use
import 'package:deck/pages/flashcard/flashcard.dart';
import 'package:deck/pages/home/home.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/settings/settings.dart';
import 'package:deck/pages/task/task.dart';
import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:flutter/widgets.dart';
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
    SettingsPage(),
  ];

  ///  Navbar Icons and Label
  final items = const [
    CurvedNavigationBarItem(
      child: Icon(
        DeckIcons.home,
        color: DeckColors.primaryColor,
      ),
      label: 'Home',
      labelStyle: TextStyle(color: DeckColors.white),
    ),
    CurvedNavigationBarItem(
      child: Icon(
        DeckIcons.task,
        color: DeckColors.primaryColor,
      ),
      label: 'Tasks',
      labelStyle: TextStyle(color: DeckColors.white),
    ),
    CurvedNavigationBarItem(
      child: Icon(
        DeckIcons.flashcard,
        color: DeckColors.primaryColor,
      ),
      label: 'Flashcards',
      labelStyle: TextStyle(color: DeckColors.white),
    ),
    CurvedNavigationBarItem(
      child: Icon(
        DeckIcons.settings,
        color: DeckColors.primaryColor,
      ),
      label: 'Settings',
      labelStyle: TextStyle(color: DeckColors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: curvedNavigationBar(),
    );
  }

  CurvedNavigationBar curvedNavigationBar() {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: DeckColors.green,
      color: DeckColors.gray,
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.easeInOut,
      height: 80,
      index: index,
      items: items,
      onTap: (index) => setState(() => this.index = index),
    );
  }
}


///
///
///
///
///
/// N A V B A R

// ignore: must_be_immutable
// class DeckBar extends StatefulWidget implements PreferredSizeWidget {
//   const DeckBar(
//       {required this.currentIndex,
//       required this.onIndexChanged,
//       required this.goToPage,
//       super.key});

//   final int currentIndex; // Current index
//   final ValueChanged<int> onIndexChanged;
//   final void Function(int) goToPage;

//   @override
//   State<DeckBar> createState() => _DeckBarState();

//   @override
//   Size get preferredSize => throw UnimplementedError();
// }

// class _DeckBarState extends State<DeckBar> {
//   final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

//   final screens = [
//     const HomePage(),
//     const TaskPage(),
//     const FlashcardPage(),
//     const SettingsPage()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return CurvedNavigationBar(
//       backgroundColor: Colors.transparent,
//       color: DeckColors.accentColor,
//       animationDuration: const Duration(milliseconds: 300),
//       animationCurve: Curves.easeInOut,
//       height: 80,
      // key: _bottomNavigationKey,
      // index: widget.currentIndex,
      // items: const [
      //   CurvedNavigationBarItem(
      //     child: Icon(
      //       DeckIcons.home,
      //       color: DeckColors.primaryColor,
      //     ),
      //     label: 'Home',
      //     labelStyle: TextStyle(color: DeckColors.white),
      //   ),
      //   CurvedNavigationBarItem(
      //     child: Icon(
      //       DeckIcons.task,
      //       color: DeckColors.primaryColor,
      //     ),
      //     label: 'Tasks',
      //     labelStyle: TextStyle(color: DeckColors.white),
      //   ),
      //   CurvedNavigationBarItem(
      //     child: Icon(
      //       DeckIcons.flashcard,
      //       color: DeckColors.primaryColor,
      //     ),
      //     label: 'Flashcards',
      //     labelStyle: TextStyle(color: DeckColors.white),
      //   ),
      //   CurvedNavigationBarItem(
      //     child: Icon(
      //       DeckIcons.settings,
      //       color: DeckColors.primaryColor,
      //     ),
      //     label: 'Settings',
      //     labelStyle: TextStyle(color: DeckColors.white),
      //   ),
      // ],
      // onTap: widget.onIndexChanged,
//     );
//   }
// }
