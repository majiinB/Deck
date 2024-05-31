import 'package:deck/backend/auth/auth_service.dart';
import 'package:deck/pages/auth/login.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RecoverAccountPage extends StatelessWidget {
  RecoverAccountPage({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthBar(
        automaticallyImplyLeading: false,
        title: 'recover acc',
        color: DeckColors.white,
        fontSize: 24,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                    'nakalimutan mo email mo kaya ka andito bonak ka haha'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enter Email',
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
              const SizedBox(
                height: 60,
              ),
              BuildButton(
                onPressed: () async {
                  try {
                    await AuthService().sendResetPass(emailController.text);
                    Navigator.of(context).pop(
                      RouteGenerator.createRoute(LoginPage()),
                    );
                  } on FirebaseAuthException catch (e) {
                    print(e.toString());
                    String message = '';
                    if(e.code == 'invalid-email'){
                      message = 'Invalid email format!';
                    } else if (e.code == 'user-not-found'){
                      message = 'User not found!';
                    } else {
                      message = 'Error finding email!';
                    }
                    showDialog(context: context, builder: (context) =>
                        AlertDialog(
                          title: Text(message),
                        ));
                  } catch (e){
                    print(e.toString());
                    showDialog(context: context, builder: (context) =>
                        AlertDialog(
                          title: Text(e.toString()),
                        ));
                  }
                },
                buttonText: 'Enter Email',
                height: 60,
                width: MediaQuery.of(context).size.width,
                radius: 10,
                backgroundColor: DeckColors.primaryColor,
                textColor: DeckColors.white,
                fontSize: 16,
                borderWidth: 0,
                borderColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
