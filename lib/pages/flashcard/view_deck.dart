import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/settings/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/task/task.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewDeckPage extends StatefulWidget {
  const ViewDeckPage({Key? key});

  @override
  _ViewDeckPageState createState() => _ViewDeckPageState();
}

class  _ViewDeckPageState extends State<ViewDeckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BackButtonAppBar(),
        body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ]
    ),
    ),
    );
  }
}
