import 'package:deck/main.dart';
import 'package:deck/pages/auth/create_account.dart';
import 'package:deck/pages/auth/login.dart';
import 'package:deck/pages/home/home.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    color: DeckColors.accentColor,
                    child: Image.asset('assets/images/Deck-Logo.png')),
              ),
              const SizedBox(
                height: 20,
              ),
              BuildButton(
                onPressed: () {},
                buttonText: 'Continue with Google',
                height: 60,
                width: MediaQuery.of(context).size.width,
                radius: 10,
                backgroundColor: Colors.transparent,
                textColor: DeckColors.white,
                fontSize: 16,
                borderWidth: 1,
                borderColor: Colors.white,
                svg: 'assets/icons/google-icon.svg',
                svgHeight: 24,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'or',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              ///
              /// TAMA NA KAYO LAPAG NG MGA DEADLINES!
              ///
              BuildButton(
                onPressed: () {
                  Navigator.of(context).push(
                    RouteGenerator.createRoute(const CreateAccountPage()),
                  );
                },
                buttonText: 'Continue with Email',
                height: 60,
                width: MediaQuery.of(context).size.width,
                radius: 10,
                backgroundColor: DeckColors.primaryColor,
                textColor: DeckColors.white,
                fontSize: 16,
                borderWidth: 0,
                borderColor: Colors.transparent,
                icon: DeckIcons.account,
                iconColor: DeckColors.white,
                size: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an Account? ',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          RouteGenerator.createRoute(const LoginPage()),
                        );
                      },
                      borderRadius: BorderRadius.circular(8),
                      splashColor: DeckColors.primaryColor.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 6), // Color of the InkWell
                        child: Text(
                          'Log In',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: DeckColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
