import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthUtils {
  final User? _user = FirebaseAuth.instance.currentUser;

  String? getDisplayName(){
    return _user?.displayName;
  }

  String? getEmail(){
    return _user?.email;
  }

  Image? getPhoto(){
    String? photoUrl = _user?.photoURL;
    if (photoUrl != null && photoUrl.isNotEmpty) {
      // Replace small photo URL with a larger one
      photoUrl = photoUrl.replaceAll("s96-c", "s400-c");
      return Image.network(photoUrl);
    }
    return null;
  }

}