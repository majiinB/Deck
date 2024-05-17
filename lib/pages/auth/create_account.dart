import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypt/crypt.dart';
import 'package:deck/backend/auth/auth_gate.dart';
import 'package:deck/backend/auth/auth_service.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String getAdjective(){

    List<String> adjective = [
      'Long', 'Short', 'Thick', 'Thin', 'Curved', 'Straight', 'Hard', 'Soft', 'Smooth',
      'Rough', 'Firm', 'Stiff', 'Limp', 'Engorged', 'Swollen', 'Massive',
      'Turgid', 'Plump', 'Slender', 'Enlarged', 'Lengthy', 'Trim', 'Sturdy', 'Malleable',
      'Elastic', 'Pulsating', 'Robust', 'Lithe', 'Luscious', 'Muscular', 'Rigid', 'Tender', 'Prominent', 'Noticeable',
      'Substantial', 'Compact', 'Potent', 'Dominant', 'Stretched', 'Expansive', 'Defined', 'Well-endowed'
    ];

    return "${adjective[Random().nextInt(adjective.length)]}_${getRandomNumber()}";
  }

  int getRandomNumber(){
    return 10000 + Random().nextInt(99999 + 1);
  }

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
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildTextBox(
                      hintText: 'Enter Email Address',
                      showPassword: false,
                      leftIcon: DeckIcons.account,
                      controller: emailController,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create New Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildTextBox(
                      hintText: 'Enter New Password',
                      showPassword: true,
                      leftIcon: DeckIcons.lock,
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Confirm New Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildTextBox(
                      hintText: 'Confirm Password',
                      showPassword: true,
                      leftIcon: DeckIcons.lock,
                      controller: confirmPasswordController,
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
                  onPressed: () async {
                    if(passwordController.text != confirmPasswordController.text) {
                      showDialog(context: context, builder: (context) =>
                      const AlertDialog(
                        title: Text("Passwords do not match!"),
                      ));
                      return;
                    }

                    if(passwordController.text.length < 6 || confirmPasswordController.text.length < 6) {
                      showDialog(context: context, builder: (context) =>
                      const AlertDialog(
                        title: Text("Password should be at least 6 characters!"),
                      ));
                      return;
                    }

                    final user = <String, dynamic> {
                      "email": emailController.text,
                      "first_name": "Anonymous",
                      "last_name": getAdjective().toString(),
                    };

                    try{
                      final db = FirebaseFirestore.instance;

                      QuerySnapshot querySnapshot = await db.collection("users").where("email", isEqualTo: emailController.text).get();
                      if(querySnapshot.docs.isNotEmpty){
                        showDialog(context: context, builder: (context) => const AlertDialog(
                          title: Text("Email already used!"),
                        ));
                        return;
                      }

                      await db.collection("users").add(user);
                      
                      await AuthService().signUpWithEmail(emailController.text, passwordController.text);

                      Navigator.of(context).push(
                        RouteGenerator.createRoute(const AuthGate()),
                      );
                    } catch (e){
                      print(e.toString());
                      showDialog(context: context, builder: (context) => const AlertDialog(
                        title: Text("Error adding user!"),
                      ));
                    }

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
