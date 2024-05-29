import 'package:deck/backend/auth/auth_service.dart';
import 'package:deck/pages/auth/signup.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/settings/change_password.dart';
import 'package:deck/pages/settings/recently_deleted.dart';
import 'package:deck/pages/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isToggled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
            BuildSettingsContainer(
              selectedIcon: Icons.light_mode,
              nameOfTheContainer: 'Light Mode',
              showArrow: false,
              showSwitch: true,
              alternateIcon: Icons.dark_mode,
              alternateText: 'Dark Mode',
              containerColor:
                  _isToggled ? Colors.green : Colors.blue, // Container Color
              selectedColor: DeckColors.primaryColor, // Left Icon Color
              textColor: Colors.white, // Text Color
              toggledColor: Colors.amber,
              onTap: () {},
              onToggleChanged: (bool value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              // onToggleChanged: (bool value) {
              //   // This function will be called when the Switch is toggled
              //   // You can implement your logic here to change colors or perform any other action
              //   if (value) {
              //     // Switch is toggled on
              //     // Perform actions for toggled state
              //   } else {
              //     // Switch is toggled off
              //     // Perform actions for untoggled state
              //   }
              // },
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
              onTap: () async {
                final authService = AuthService();
                authService.signOut();
                GoogleSignIn _googleSignIn = GoogleSignIn();
                if(await _googleSignIn.isSignedIn()) {
                  await _googleSignIn.signOut();
                }
                Navigator.of(context).push(
                  RouteGenerator.createRoute(const SignUpPage()),
                );
                // ignore: avoid_print
                print("Log Out Clicked");
              },
            ),
          ],
        ),
      ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
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
                  padding: const EdgeInsets.only(top: 15),
                    child: BuildContainer(
                      selectedIcon: DeckIcons.lock,
                      nameOfTheContainer: 'Change Password',
                      showArrow: true,
                      showSwitch: false,
                      onTap: () {
                        print("Change Password Clicked");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => changePassword()));

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
                      print("Recently Deleted Clicked");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RecentlyDeletedPage()));

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