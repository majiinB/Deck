import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/task/todo.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/task/task.dart';

class FlashcardPage extends StatelessWidget {
  const FlashcardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeckBar(
        title: 'sdsd',
        color: DeckColors.white,
        fontSize: 24,
        onPressed: () {},
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              RouteGenerator.createRoute(const TodoPage()),
            );
          },
          child: Text('ETO FLASHCARD'),
        ),
      ),
    );
  }
}
