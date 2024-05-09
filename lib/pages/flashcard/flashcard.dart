import 'package:deck/pages/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/task/task.dart';

class FlashcardPage extends StatelessWidget {
  const FlashcardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthBar(
        title: 'sdsd',
        color: DeckColors.white,
        fontSize: 24,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the second page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskPage()),
            );
          },
          child: Text('ETO FLASHCARD'),
        ),
      ),
    );
  }
}
