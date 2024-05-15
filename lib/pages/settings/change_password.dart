import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => ChangePasswordPageState();
}

class ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthBar(
        automaticallyImplyLeading: false,
        title: 'sign up',
        color: DeckColors.primaryColor,
        fontSize: 24,
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter a new password below to change your password.',
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: DeckColors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: DeckColors.gray,
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: BuildTextBox(
                        hintText: 'Enter Old Password',
                        showPassword: true,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: BuildTextBox(
                        hintText: 'Enter New Password',
                        showPassword: true,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: BuildTextBox(
                        hintText: 'Confirm New Password',
                        showPassword: true,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 100, left: 20, right: 20),
                      child: BuildButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print(
                              "save button clicked"); //line to test if working ung onPressedLogic XD
                          showConfirmationDialog(
                            context,
                            "Change Password",
                            "Are you sure you want to change password?",
                            () {
                              //when user clicks yes
                              //add logic here
                            },
                            () {
                              //when user clicks no
                              //add logic here
                            },
                          );
                        },
                        buttonText: 'Save Password',
                        height: 50.0,
                        width: MediaQuery.of(context).size.width,
                        backgroundColor: DeckColors.primaryColor,
                        textColor: DeckColors.white,
                        radius: 10.0,
                        borderColor: Colors.amber,
                        fontSize: 16,
                        borderWidth: 0,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: BuildButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print(
                              "cancel button clicked"); //line to test if working ung onPressedLogic XD
                          Navigator.pop(context);
                        },
                        buttonText: 'Cancel',
                        height: 50.0,
                        width: MediaQuery.of(context).size.width,
                        backgroundColor: DeckColors.white,
                        textColor: DeckColors.primaryColor,
                        radius: 10.0,
                        borderColor: Colors.amber,
                        fontSize: 16,
                        borderWidth: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}