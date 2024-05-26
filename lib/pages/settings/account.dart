import 'dart:typed_data';

import 'package:deck/backend/auth/auth_service.dart';
import 'package:deck/backend/auth/auth_utils.dart';
import 'package:deck/pages/settings/edit_profile.dart';
import 'package:deck/pages/settings/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/misc/widget_method.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  String name = '';

  List<String> deckTitles = [
    'Deck ni leila malaki',
    'Deck ko malaki',
    'Deck nating lahat malaki',
  ];

  List<String> deckNumbers = ['69 Cards', '96 Cards', '88 Cards'];
  late Image? coverUrl;

  @override
  void initState() {
    coverUrl = null;
    getCoverUrl();
    super.initState();
  }

  void getCoverUrl() async{
      coverUrl = await AuthUtils().getCoverPhotoUrl();
      setState(() {

      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerLeft,
                children: [
                  BuildCoverImage(
                      borderRadiusContainer: 0, borderRadiusImage: 0, CoverPhotofile: coverUrl,),
                  Positioned(
                    top: 200,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 0,
                      color: DeckColors.gray,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 16,
                    child: BuildIconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          RouteGenerator.createRoute(const SettingPage()),
                        );
                      },
                      icon: DeckIcons.settings,
                      iconColor: DeckColors.white,
                      backgroundColor: DeckColors.accentColor,
                      containerWidth: 40,
                      containerHeight: 40,
                    ),
                  ),
                  Positioned(
                    top: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildProfileImage(AuthUtils().getPhoto()),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, left: 8.0),
                            child: Text(
                              AuthUtils().getDisplayName() ?? "Guest",
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: DeckColors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              AuthUtils().getEmail() ?? "guest@guest.com",
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                color: DeckColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, right: 7.0),
                    child: BuildButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          RouteGenerator.createRoute(const EditProfile()),
                        );
                      },
                      buttonText: 'edit profile',
                      height: 40,
                      width: 140,
                      backgroundColor: DeckColors.white,
                      textColor: DeckColors.backgroundColor,
                      radius: 20.0,
                      fontSize: 16,
                      borderWidth: 0,
                      borderColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130, left: 16.0),
                child: Text(
                  "My Decks",
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: DeckColors.primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: deckTitles.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: BuildListOfDecks(
                        titleText: deckTitles[index],
                        numberText: deckNumbers[index],
                        onDelete: () {
                          final String deletedTitle = deckTitles[index];
                          final String deletedNumber = deckNumbers[index];

                          setState(() {
                            deckTitles.removeAt(index);
                            deckNumbers.removeAt(index);
                          });
                          showConfirmationDialog(
                            context,
                            "Delete Item",
                            "Are you sure you want to delete '$deletedTitle'?",
                            () {},
                            () {
                              setState(() {
                                //when the user clicks no
                                deckTitles.insert(index, deletedTitle);
                                deckNumbers.insert(index, deletedNumber);
                              });
                            },
                          );
                        },
                        enableSwipeToRetrieve: false,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
