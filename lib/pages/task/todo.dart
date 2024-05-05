import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TaskAppBar(),
      body: Column(),
    );
  }
}
