import 'package:deck/pages/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/task/task.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class  _AccountPageState extends State<AccountPage> {
  List<String> deckTitles = [
    'Deck ni leila malaki',
    'Deck ko malaki',
    'Deck nating lahat malaki',
  ];

  List<String> deckNumbers = ['69 Cards', '96 Cards', '88 Cards'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerLeft,
              children: [
                BuildCoverImage(),
                Positioned(
                  top: 200,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    color: DeckColors.gray,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(DeckIcons.settings, color: DeckColors.gray),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));

                      //add more logic here
                    },
                  ),
                ),
                Positioned(
                  top: 212,
                  right: 16,
                  child: buildButton(
                    onPressed: () {
                      // Logic here
                    },
                    buttonText: 'edit profile',
                    height: 40.0,
                    width: 120.0,
                    backgroundColor: DeckColors.white,
                    textColor: DeckColors.backgroundColor,
                  ),
                ),
                Positioned(
                  top: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildProfileImage(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                          child: Text(
                            "POLE - DI MAGUIBA",
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
                            "pasadsasdads@gmail.com",
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
            Padding(
              padding: const EdgeInsets.only(top: 180, left: 16.0),
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
                        showDeleteConfirmationDialog(
                          context,
                          "Delete Item",
                          "Are you sure you want to delete '$deletedTitle'?",
                              () {
                          },
                              () {
                                setState(() {//when the user clicks no
                                  deckTitles.insert(index, deletedTitle);
                                  deckNumbers.insert(index, deletedNumber);
                                });
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
