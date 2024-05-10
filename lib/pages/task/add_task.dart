import 'package:deck/pages/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AuthBar(
        title: 'Add New',
        color: DeckColors.white,
        fontSize: 24,
      ),
      body: Column(),
    );
  }
}
