import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

///
///
///
/// A P P B A R

/// DefaultHome is the Home Page by default in Deck
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'deck',
        style: TextStyle(fontFamily: 'Fraiche', fontSize: 24),
      ),
      foregroundColor: DeckColors.primaryColor,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

///
///
/// TaskPage is the Todo List Page in Deck
class TaskAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TaskAppBar({super.key});

  @override
  State<TaskAppBar> createState() => _TaskAppBarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _TaskAppBarState extends State<TaskAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Task Page'),
      centerTitle: true,
      foregroundColor: Colors.amber,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          DeckIcons.backArrow,
          size: 24,
        ),
      ),
    );
  }
}

///
///
/// Navbar with Back Button Plain
class BackButtonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackButtonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Hi'),
      foregroundColor: Colors.green,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
