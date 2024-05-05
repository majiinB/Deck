import 'package:deck/pages/task/todo.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TodoPage()),
              ),
              child: Text('SETTINGS TO AH'),
            ),
          ],
        ),
      ),
    );
  }
}
