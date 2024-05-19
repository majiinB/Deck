import 'package:deck/backend/auth/auth_service.dart';
import 'package:deck/backend/flashcard/flashcard_service.dart';
import 'package:deck/backend/models/deck.dart';
import 'package:deck/pages/flashcard/add_deck.dart';
import 'package:deck/pages/flashcard/view_deck.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashcardPage extends StatefulWidget {

  const FlashcardPage({Key? key});

  @override
  _FlashcardPageState createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  final AuthService _authService = AuthService();
  final FlashcardService _flashcardService = FlashcardService();
  List<Deck> _decks = [];
  late User? _user;
  // List<String> deckTitles = [
  //   'Deck ni leila malaki',
  //   'Deck ko malaki',
  //   'Deck nating lahat malaki',
  // ];

  @override
  void initState() {
    super.initState();
    _user = _authService.getCurrentUser();
    _initUserDecks();
  }

  void _initUserDecks() async{
    _user = _authService.getCurrentUser(); // Get current user
    if (_user != null) {
      String userId = _user!.uid;
      print(userId);
      List<Deck> decks = await _flashcardService.getDecksByUserId(userId); // Call method to fetch decks
      print(decks);
      setState(() {
        _decks = decks; // Update state with fetched decks
      });
    }
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: DeckFAB(
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
            if (_decks.isNotEmpty)
              Text(
                'Latest Review',
                style: GoogleFonts.nunito(
                  color: DeckColors.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            if (_decks.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: DeckColors.gray),
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
                        child: BuildButton(
                          onPressed: () {
                            print("Continue Learning Button Clicked");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewDeckPage(deck: _decks[1])),
                            );
                          },
                          buttonText: 'Continue Learning',
                          height: 35,
                          width: 180,
                          radius: 20,
                          backgroundColor: DeckColors.accentColor,
                          textColor: DeckColors.white,
                          fontSize: 16,
                          borderWidth: 0,
                          borderColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (_decks.isEmpty)
              IfDeckEmpty(
                  ifDeckEmptyText: 'No Deck(s) Available',
                  ifDeckEmptyheight: MediaQuery.of(context).size.height * 0.7),
            if (_decks.isNotEmpty)
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
            if (_decks.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: BuildTextBox(
                  hintText: 'Search Decks',
                  showPassword: false,
                  rightIcon: Icons.search,
                ),
              ),
            if (_decks.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _decks.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: BuildDeckContainer(
                        titleOfDeck: _decks[index].title,
                        onDelete: () {
                          final Deck deletedTitle = _decks[index];

                          showConfirmationDialog(
                            context,
                            "Delete Item",
                            "Are you sure you want to delete '$deletedTitle'?",
                            () {
                              setState(() {
                                _decks.removeAt(index);
                              });
                            },
                            () {
                              setState(() {
                                //when the user clicks no
                              });
                            },
                          );
                        },
                        enableSwipeToRetrieve: false,
                        onTap: () {
                          print("Clicked");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewDeckPage(deck: _decks[index])),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
