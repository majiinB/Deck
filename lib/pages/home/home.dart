import 'package:deck/pages/misc/widget_method.dart';
import 'package:flutter/material.dart';
// import 'package:deck/pages/account/account.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  void goToPage(int pageIndex) {
    setState(() {
      index = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      // bottomNavigationBar: DeckBar(
      //   currentIndex: index,
      //   onIndexChanged: (int newIndex) {
      //     setState(() {
      //       index = newIndex;
      //     });
      //   },
      //   // Pass the callback function from HomePage to DeckBar
      //   goToPage: (int pageIndex) {
      //     // Navigate to the specified page
      //     setState(() {
      //       index = pageIndex;
      //     });
      //   },
      // ),
    );
  }
}
