import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
const SettingPage({Key? key});

@override
_SettingPageState createState() => _SettingPageState();
}

class  _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: const BackButtonAppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                const BuildContainer(selectedIcon: Icons.light_mode,
                  nameOfTheContainer: 'Light Mode',
                    showArrow: false,
                    showSwitch: true,
                      alternateIcon: Icons.dark_mode,
                      alternateText: 'Dark Mode'
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                    child: BuildContainer(
                      selectedIcon: DeckIcons.lock,
                      nameOfTheContainer: 'Change Password',
                      showArrow: true,
                      showSwitch: false,
                      onTap: () {
                        print("Change Password Clicked");
                      },
                    ),
                  ),
                  BuildContainer(selectedIcon: DeckIcons.logout,
                    nameOfTheContainer: 'Log Out',
                    showArrow: false,
                    showSwitch: false,
                   onTap: () {
                     print("Log Out Clicked");
                   },
                  ),
              ],
            ),
          ),
    );
  }

}