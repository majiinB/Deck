import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deck/main.dart';
import 'package:deck/pages/auth/signup.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../fcm/fcm_service.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  _AuthGateState createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    _updateFcmToken();
  }

  Future<void> _updateFcmToken() async {
    final currentUser = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return MainPage(index: 0,);
          } else {
            return const SignUpPage();
          }
        },
      ),
    );
  }
}