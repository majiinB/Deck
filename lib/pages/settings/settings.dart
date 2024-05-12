import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/settings/change_password.dart';
import 'package:deck/pages/settings/recently_deleted.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthBar(
        automaticallyImplyLeading: true,
        title: 'sign up',
        color: DeckColors.primaryColor,
        fontSize: 24,
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            const BuildContainer(
                selectedIcon: Icons.light_mode,
                nameOfTheContainer: 'Light Mode',
                showArrow: false,
                showSwitch: true,
                alternateIcon: Icons.dark_mode,
                alternateText: 'Dark Mode'),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: BuildContainer(
                selectedIcon: DeckIcons.lock,
                nameOfTheContainer: 'Change Password',
                showArrow: true,
                showSwitch: false,
                onTap: () {
                  // ignore: avoid_print
                  print("Change Password Clicked");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangePassword()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: BuildContainer(
                selectedIcon: DeckIcons.trash_bin,
                nameOfTheContainer: 'Recently Deleted',
                showArrow: true,
                showSwitch: false,
                onTap: () {
                  // ignore: avoid_print
                  print("Recently Deleted Clicked");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecentlyDeletedPage()));
                },
              ),
            ),
            BuildContainer(
              selectedIcon: DeckIcons.logout,
              nameOfTheContainer: 'Log Out',
              showArrow: false,
              showSwitch: false,
              onTap: () {
                // ignore: avoid_print
                print("Log Out Clicked");
              },
            ),
          ],
        ),
      ),
    );
  }
}
