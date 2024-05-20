import 'package:deck/pages/flashcard/add_flashcard.dart';
import 'package:deck/pages/flashcard/edit_flashcard.dart';
import 'package:deck/pages/flashcard/play_my_deck.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../backend/models/deck.dart';

class ViewDeckPage extends StatefulWidget {
  final Deck deck;
  const ViewDeckPage({Key? key, required this.deck}) : super(key: key);

  @override
  _ViewDeckPageState createState() => _ViewDeckPageState();
}

class _ViewDeckPageState extends State<ViewDeckPage> {

  var _cardsCollection = [];
  var _starredCardCollection = [];

  @override
  void initState() {
    super.initState();
    _initDeckCards();
  }
  void _initDeckCards() async {
    var cards = await widget.deck.getCard();
    var starredCards = [];
    for(int i = 0; i<cards.length; i++){
      if(cards[i].isStarred){
        starredCards.add(cards[i]);
      }
    }
    setState(() {
      _cardsCollection = cards;
      _starredCardCollection = starredCards;
    });
  }
  @override
  Widget build(BuildContext context) {
    double topPadding =
        (_cardsCollection.isNotEmpty || _cardsCollection.isNotEmpty)
            ? 20.0
            : 40.0;
    return Scaffold(
      floatingActionButton: DeckFAB(
        text: "Add FlashCard",
        fontSize: 12,
        icon: Icons.add,
        foregroundColor: DeckColors.primaryColor,
        backgroundColor: DeckColors.gray,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFlashcardPage()),
          );
        },
      ),
      appBar: const DeckBar(
        title: 'View Deck',
        color: DeckColors.white,
        fontSize: 24,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.deck.title.toString(),
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.nunito(
                color: DeckColors.white,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: BuildButton(
                onPressed: () {
                  print("Laruin mo deck ko");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlayMyDeckPage()),
                  );
                },
                buttonText: 'Play My Deck',
                height: 35,
                width: 180,
                radius: 20,
                backgroundColor: DeckColors.primaryColor,
                textColor: DeckColors.white,
                fontSize: 16,
                borderWidth: 0,
                borderColor: Colors.transparent,
              ),
            ),
            if (_cardsCollection.isNotEmpty || _cardsCollection.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: BuildTextBox(
                  hintText: 'Search Flashcard',
                  showPassword: false,
                  rightIcon: Icons.search,
                ),
              ),
            Padding(
              padding: EdgeInsets.only(top: topPadding),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .6,
                child: BuildTabBar(
                  titles: ['All', 'Starred'],
                  length: 2,
                  tabContent: [
                    ///
                    ///
                    /// ------------------------- START OF TAB 'ALL' CONTENT ----------------------------
                    if (_cardsCollection.isEmpty)
                      IfDeckEmpty(
                        ifDeckEmptyText: 'No Flashcard(s) Available',
                        ifDeckEmptyheight:
                            MediaQuery.of(context).size.height * 0.3,
                      ),
                    if (_cardsCollection.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _cardsCollection.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: BuildContainerOfFlashCards(
                                    titleOfFlashCard: _cardsCollection[index].question,
                                    contentOfFlashCard: _cardsCollection[index].answer,
                                    onDelete: () {
                                      final String deletedTitle =
                                        _cardsCollection[index].question;
                                      // final String deletedNumber =
                                      //   _cardsCollection[index];
                                      showConfirmationDialog(
                                        context,
                                        "Delete Item",
                                        "Are you sure you want to delete '$deletedTitle'?",
                                        () {
                                          setState(() {
                                            _cardsCollection[index].updateDeleteStatus(true, widget.deck.deckId);
                                            _cardsCollection.removeAt(index);
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
                                            builder: (context) =>
                                                EditFlashcardPage()),
                                      );
                                    },
                                    isStarShaded: _cardsCollection[index].isStarred,
                                    onStarShaded: () {
                                      setState(() {
                                        try{
                                          _cardsCollection[index].updateStarredStatus(true, widget.deck.deckId);
                                          _starredCardCollection.add(_cardsCollection[index]);
                                          _cardsCollection[index].isStarred = true;
                                        }catch(e){
                                          print('star shaded error: $e');
                                        }
                                      });
                                    },
                                    onStarUnshaded: () {
                                      setState(() {
                                        try{
                                          _cardsCollection[index].updateStarredStatus(false, widget.deck.deckId);
                                          _starredCardCollection.removeWhere(
                                                  (card) => card.cardId == _cardsCollection[index].cardId
                                          );
                                          _cardsCollection[index].isStarred = false;
                                        }catch(e){
                                          print('star shaded error: $e');
                                        }

                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                    ///
                    ///
                    /// ------------------------- END OF TAB 'ALL' CONTENT ----------------------------

                    ///
                    ///
                    /// ------------------------- START OF TAB 'STARRED' CONTENT ----------------------------
                    if (_starredCardCollection.isEmpty)
                      IfDeckEmpty(
                        ifDeckEmptyText: 'No Starred Flashcard(s) Available',
                        ifDeckEmptyheight:
                            MediaQuery.of(context).size.height * 0.3,
                      ),
                    if (_starredCardCollection.isNotEmpty)
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _starredCardCollection.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: BuildContainerOfFlashCards(
                                  titleOfFlashCard:
                                    _starredCardCollection[index].question,
                                  contentOfFlashCard:
                                    _starredCardCollection[index].answer,
                                  onDelete: () {
                                    final String starredDeletedTitle =
                                      _starredCardCollection[index].question;
                                    final String starredDeletedNumber =
                                      _starredCardCollection[index].answer;

                                    showConfirmationDialog(
                                      context,
                                      "Delete Item",
                                      "Are you sure you want to delete '$starredDeletedTitle'?",
                                      () {
                                        setState(() {
                                          _starredCardCollection[index].updateDeleteStatus(true, widget.deck.deckId);
                                          _starredCardCollection.removeAt(index);
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
                                          builder: (context) =>
                                              EditFlashcardPage()),
                                    );
                                  },
                                  isStarShaded: true,
                                  onStarShaded: () {
                                    //No action kasi lagi naman shaded yung andito
                                  },
                                  onStarUnshaded: () {
                                    setState(() {
                                      try{
                                        _starredCardCollection[index].updateStarredStatus(false, widget.deck.deckId);
                                        _starredCardCollection[index].isStarred = false;
                                        _starredCardCollection.removeWhere(
                                                (card) => card.cardId == _starredCardCollection[index].cardId
                                        );
                                      }catch(e){
                                        print('star shaded error: $e');
                                      }
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

      ///
      ///
      /// ------------------------- END OF TAB 'STARRED' CONTENT ----------------------------
    );
  }
}
