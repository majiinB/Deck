import 'package:deck/main.dart';
import 'package:deck/pages/auth/signup.dart';
import 'package:deck/pages/flashcard/flashcard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return const MainPage();
            }
            else {
              return const SignUpPage();
            }
          },

        )
    );
  }
}