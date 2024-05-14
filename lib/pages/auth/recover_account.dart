import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:flutter/material.dart';

class RecoverAccountPage extends StatelessWidget {
  const RecoverAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthBar(
        automaticallyImplyLeading: false,
        title: 'log in',
        color: DeckColors.white,
        fontSize: 24,
      ),
    );
  }
}
