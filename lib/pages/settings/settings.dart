import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/task/task.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the second page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskPage()),
            );
          },
          child: Text('SETTINGS TO AH'),
        ),
      ),
    );
  }
}
