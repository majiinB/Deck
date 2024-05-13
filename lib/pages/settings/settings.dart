import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/settings/change_password.dart';
import 'package:deck/pages/settings/recently_deleted.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthBar(
        automaticallyImplyLeading: true,
        title: 'settings',
        color: DeckColors.primaryColor,
        fontSize: 24,
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            const BuildSettingsContainer(
              selectedIcon: Icons.light_mode,
              nameOfTheContainer: 'Light Mode',
              showArrow: false,
              showSwitch: true,
              alternateIcon: Icons.dark_mode,
              alternateText: 'Dark Mode',
              containerColor: DeckColors.accentColor, // Container Color
              selectedColor: DeckColors.primaryColor, // Left Icon Color
              textColor: Colors.white, // Text Color
              toggledColor: Colors.amber, // Left Icon Color when Toggled
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: BuildSettingsContainer(
                selectedIcon: DeckIcons.lock,
                nameOfTheContainer: 'Change Password',
                showArrow: true,
                showSwitch: false,
                containerColor: DeckColors.accentColor, // Container Color
                selectedColor: DeckColors.primaryColor, // Left Icon Color
                textColor: Colors.white, // Text Color
                toggledColor: Colors.amber, // Left Icon Color when Toggled
                onTap: () {
                  Navigator.of(context).push(
                    RouteGenerator.createRoute(const ChangePasswordPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: BuildSettingsContainer(
                selectedIcon: DeckIcons.trash_bin,
                nameOfTheContainer: 'Recently Deleted',
                showArrow: true,
                showSwitch: false,
                containerColor: DeckColors.accentColor, // Container Color
                selectedColor: DeckColors.primaryColor, // Left Icon Color
                textColor: Colors.white, // Text Color
                toggledColor: Colors.amber, // Left Icon Color when Toggled
                onTap: () {
                  Navigator.of(context).push(
                    RouteGenerator.createRoute(const RecentlyDeletedPage()),
                  );
                },
              ),
            ),
            BuildSettingsContainer(
              selectedIcon: DeckIcons.logout,
              nameOfTheContainer: 'Log Out',
              showArrow: false,
              showSwitch: false,
              containerColor: DeckColors.accentColor, // Container Color
              selectedColor: DeckColors.primaryColor, // Left Icon Color
              textColor: Colors.white, // Text Color
              toggledColor: Colors.amber, // Left Icon Color when Toggled
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
