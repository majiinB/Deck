import 'package:deck/pages/flashcard/add_deck.dart';
import 'package:deck/pages/flashcard/view_deck.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashcardPage extends StatefulWidget {
  const FlashcardPage({Key? key});

  @override
  _FlashcardPageState createState() => _FlashcardPageState();
}

class  _FlashcardPageState extends State<FlashcardPage> {

List<String> deckTitles = [
    'Deck ni leila malaki',
    'Deck ko malaki',
    'Deck nating lahat malaki',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: DeckFAB(
          text: "Add Deck",
          fontSize: 12,
          icon: Icons.add,
          foregroundColor: DeckColors.primaryColor,
          backgroundColor: DeckColors.gray,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddDeckPage()),
            );
          },
        ),
        appBar: const DeckBar(
          title: 'Flash Card',
          color: DeckColors.white,
          fontSize: 24,
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(deckTitles.isNotEmpty)
              Text(
                'Latest Review',
                style: GoogleFonts.nunito(
                  color: DeckColors.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            if(deckTitles.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: DeckColors.gray
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deck ni Leila 101',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.nunito(
                        color: DeckColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: BuildButton(onPressed: (){
                        print("Continue Learning Button Clicked");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ViewDeckPage()),
                        );
                      },
                          buttonText: 'Continue Learning',
                          height: 35, width: 180,
                          radius: 20,
                          backgroundColor: DeckColors.accentColor, textColor: DeckColors.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (deckTitles.isEmpty)
             ifDeckEmpty(ifDeckEmptyText: 'No Deck(s) Available',
                 ifDeckEmptyheight: MediaQuery.of(context).size.height * 0.7
             ),
            if(deckTitles.isNotEmpty)
              Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'My Decks',
                style: GoogleFonts.nunito(
                  color: DeckColors.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ),
            if(deckTitles.isNotEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: BuildTextBox(hintText: 'Search Decks', showPassword: false, rightIcon: Icons.search,),
            ),
            if(deckTitles.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: deckTitles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: BuildDeckContainer(
                      titleOfDeck: deckTitles[index],
                      onDelete: () {
                        final String deletedTitle = deckTitles[index];

                        showConfirmationDialog(
                          context,
                          "Delete Item",
                          "Are you sure you want to delete '$deletedTitle'?",
                              () {
                                setState(() {
                                  deckTitles.removeAt(index);
                                });
                          },
                              () {
                            setState(() {//when the user clicks no

                            });
                          },
                        );
                      }, enableSwipeToRetrieve: false, onTap: () {
                        print("Clicked");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ViewDeckPage()),
                        );
                    },
                    ),
                  );
                },
              ),
            ),

            ],
        ),
      )
    );
  }
}
