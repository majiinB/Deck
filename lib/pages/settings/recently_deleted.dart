import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:flutter/material.dart';

class RecentlyDeletedPage extends StatefulWidget {
  const RecentlyDeletedPage({super.key});

  @override
  State<RecentlyDeletedPage> createState() => _RecentlyDeletedPageState();
}

class _RecentlyDeletedPageState extends State<RecentlyDeletedPage> {
  List<String> deckTitles = [
    "Deck ni leila malaki",
    "Deck ko malaki",
    "Deck nating lahat malaki",
    "Mystic Realms",
    "Tech Titans",
    "Nature's Symphony",
    "Cosmic Conquest",
    "Legends of the East",
    "Rogue's Gambit"
  ];

  List<String> deckNumbers = [
    '69 Cards',
    '96 Cards',
    '88 Cards',
    '72 Cards',
    '105 Cards',
    '54 Cards',
    '80 Cards',
    '120 Cards',
    '63 Cards'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthBar(
        automaticallyImplyLeading: false,
        title: 'sign up',
        color: DeckColors.primaryColor,
        fontSize: 24,
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BuildTextBox(
              hintText: 'Search Decks',
              showPassword: false,
              leftIcon: Icons.search,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: BuildButton(
                onPressed: () {
                  // ignore: avoid_print
                  print(
                      "save button clicked"); //line to test if working ung onPressedLogic XD
                  showConfirmationDialog(
                    context,
                    "Are you sure you want to delete all items?",
                    "Note: Once you delete the item(s) included, you will no longer be able to retrieve it. Proceed with caution.",
                    () {
                      //when user clicks yes
                      setState(() {
                        deckTitles.clear();
                        deckNumbers.clear();
                      });
                    },
                    () {
                      //when user clicks no
                      //add logic here
                    },
                  );
                },
                buttonText: 'Delete All',
                height: 50.0,
                width: 200.0,
                backgroundColor: Colors.red,
                textColor: DeckColors.white,
                radius: 10.0,
                fontSize: 16.0,
                borderColor: Colors.amber,
                borderWidth: 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
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
                      onRetrieve: () {
                        final String retrievedTitle = deckTitles[index];
                        final String retrievedNumber = deckNumbers[index];
                        setState(() {
                          deckTitles.removeAt(index);
                          deckNumbers.removeAt(index);
                        });
                        showConfirmationDialog(
                          context,
                          "Retrieve Item",
                          "Are you sure you want to retrieve '$retrievedTitle'?",
                          () {},
                          () {
                            setState(() {
                              //when the user clicks no
                              deckTitles.insert(index, retrievedTitle);
                              deckNumbers.insert(index, retrievedNumber);
                            });
                          },
                        );
                      },
                      enableSwipeToRetrieve: true,
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
