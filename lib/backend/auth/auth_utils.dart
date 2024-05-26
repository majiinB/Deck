import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthUtils {
  final User? _user = FirebaseAuth.instance.currentUser;

  String? getDisplayName(){
    return _user?.displayName;
  }

  List<String>? getSplitDisplayName(){
    String? name = getDisplayName();
    return name?.split(' ').toList();
  }

  String? getLastName(){
    List<String>? list = getSplitDisplayName();
    print(list?.last);
    if(list!.length < 2) return "";
    return list?.last;
  }

  String? getFirstName(){
    List<String>? list = getSplitDisplayName();
    String name = "";
    if (list == null || list.isEmpty) return '';
    if(list!.length < 2) return list?.first;
    for(int i = 0 ; i < list!.length - 1; i++){
      name += list[i];
      if(i != list!.length - 1) {
        name += " ";
      }
    }
    print(name);
    return name;
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