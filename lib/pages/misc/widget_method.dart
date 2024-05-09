import 'package:deck/pages/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_svg/flutter_svg.dart';

///
///
///
/// ---------------------- A P P B A R ------------------------

///
///
/// DeckBar is an AppBar with the font Nunito (used in typical routes)
class DeckBar extends StatelessWidget implements PreferredSizeWidget {
  const DeckBar({
    super.key,
    required this.title,
    required this.color,
    required this.fontSize,
  });

  final String title;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.nunito(
            fontSize: fontSize, fontWeight: FontWeight.w900, color: color),
      ),
      centerTitle: true,
      foregroundColor: const Color.fromARGB(255, 61, 61, 61),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

///
///
/// AuthBar is an AppBar with the font Fraiche (used in auth and main routes)
class AuthBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthBar({
    super.key,
    required this.title,
    required this.color,
    required this.fontSize,
  });
  final String title;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Fraiche',
            fontSize: fontSize,
            color: color,
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}


///
///
///
/// -------------- R O U T E  A N I M A T I O N ----------------
class RouteGenerator {
  static Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
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
}