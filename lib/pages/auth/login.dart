import 'package:deck/main.dart';
import 'package:deck/pages/auth/create_account.dart';
import 'package:deck/pages/auth/recover_account.dart';
import 'package:deck/pages/auth/signup.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthBar(
        automaticallyImplyLeading: false,
        title: 'log in',
        color: DeckColors.white,
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
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    color: DeckColors.accentColor,
                    child: Image.asset('assets/images/Deck-Logo.png')),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BuildTextBox(
                      hintText: 'Enter Email Address',
                      showPassword: false,
                      leftIcon: DeckIcons.account,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BuildTextBox(
                      hintText: 'Enter Password',
                      showPassword: false,
                      leftIcon: DeckIcons.lock,
                      rightIcon: Icons.search,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      RouteGenerator.createRoute(const RecoverAccountPage()),
                    );
                  },
                  borderRadius: BorderRadius.circular(8),
                  splashColor: DeckColors.primaryColor.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4, horizontal: 6), // Color of the InkWell
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: DeckColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              BuildButton(
                onPressed: () {
                  Navigator.of(context).push(
                    RouteGenerator.createRoute(const MainPage()),
                  );
                },
                buttonText: 'Log In',
                height: 60,
                width: MediaQuery.of(context).size.width,
                radius: 10,
                backgroundColor: DeckColors.primaryColor,
                textColor: DeckColors.white,
                fontSize: 16,
                borderWidth: 0,
                borderColor: Colors.transparent,
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
              BuildButton(
                onPressed: () {
                  Navigator.of(context).push(
                    RouteGenerator.createRoute(const MainPage()),
                  );
                },
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
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop(
                          RouteGenerator.createRoute(const SignUpPage()),
                        );
                      },
                      borderRadius: BorderRadius.circular(8),
                      splashColor: DeckColors.primaryColor.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 6), // Color of the InkWell
                        child: Text(
                          'Sign Up',
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