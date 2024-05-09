import 'package:deck/main.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/task/task.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthBar(
        title: 'sign up',
        color: DeckColors.primaryColor,
        fontSize: 24,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              RouteGenerator.createRoute(const MainPage()),
            );
          },
          child: Text('ETO FLASHCARD'),
        ),
      ),
    );
  }
}
