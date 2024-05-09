import 'package:deck/pages/task/todo.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/misc/colors.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthBar(
        title: 'sdsd',
        color: DeckColors.white,
        fontSize: 24,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_createRoute());
              },
              child: Text('SETTINGS TO AH'),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const TodoPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Animation starts from right to left
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
