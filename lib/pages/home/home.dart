import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:flutter/material.dart';

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
      appBar: AuthBar(
        title: 'temporary title',
        color: DeckColors.white,
        fontSize: 24,
      ),
    );
  }
}
