import 'package:deck/pages/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AuthBar(
        automaticallyImplyLeading: false,
        title: 'sdsd',
        color: DeckColors.white,
        fontSize: 24,
      ),
      body: Column(),
    );
  }
}
