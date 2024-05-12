import 'package:deck/main.dart';
import 'package:deck/pages/auth/signup.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthBar(
        automaticallyImplyLeading: true,
        title: 'create account',
        color: DeckColors.white,
        fontSize: 24,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
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
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create New Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BuildTextBox(
                      hintText: 'Enter New Password',
                      showPassword: true,
                      leftIcon: DeckIcons.lock,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Confirm New Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BuildTextBox(
                      hintText: 'Confirm Password',
                      showPassword: true,
                      leftIcon: DeckIcons.lock,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                      child: DeckBox(),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "I accept Deck's",
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
                            vertical: 0, horizontal: 6), // Color of the InkWell
                        child: Text(
                          'Terms of Use',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: DeckColors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "and",
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
                            vertical: 0, horizontal: 6), // Color of the InkWell
                        child: Text(
                          'Privacy Policy',
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
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: BuildButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      RouteGenerator.createRoute(const MainPage()),
                    );
                  },
                  buttonText: 'Join the Deck Party!',
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  radius: 10,
                  backgroundColor: DeckColors.primaryColor,
                  textColor: DeckColors.white,
                  fontSize: 16,
                  borderWidth: 0,
                  borderColor: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
