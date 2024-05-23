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
  var _filteredCardsCollection = [];
  var _filteredStarredCardCollection = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initDeckCards();
    _searchController.addListener(_filterFlashcards);
  }

  void _initDeckCards() async {
    var cards = await widget.deck.getCard();
    var starredCards = [];
    for (int i = 0; i < cards.length; i++) {
      if (cards[i].isStarred) {
        starredCards.add(cards[i]);
      }
    }
    setState(() {
      _cardsCollection = cards;
      _starredCardCollection = starredCards;
      _filteredCardsCollection = cards;
      _filteredStarredCardCollection = starredCards;
    });
  }

  void _filterFlashcards() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCardsCollection = _cardsCollection
          .where((card) =>
      card.question.toLowerCase().contains(query) ||
          card.answer.toLowerCase().contains(query))
          .toList();
      _filteredStarredCardCollection = _starredCardCollection
          .where((card) =>
      card.question.toLowerCase().contains(query) ||
          card.answer.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double topPadding =
    (_cardsCollection.isNotEmpty || _starredCardCollection.isNotEmpty)
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
            if (_cardsCollection.isNotEmpty || _starredCardCollection.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: BuildTextBox(
                  controller: _searchController,
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
                    if (_filteredCardsCollection.isEmpty)
                      IfDeckEmpty(
                        ifDeckEmptyText: 'No Flashcard(s) Available',
                        ifDeckEmptyheight: MediaQuery.of(context).size.height * 0.3,
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _filteredCardsCollection.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                                  child: BuildContainerOfFlashCards(
                                    titleOfFlashCard: _filteredCardsCollection[index].question,
                                    contentOfFlashCard: _filteredCardsCollection[index].answer,
                                    onDelete: () {
                                      final String deletedTitle = _filteredCardsCollection[index].question;
                                      showConfirmationDialog(
                                        context,
                                        "Delete Item",
                                        "Are you sure you want to delete '$deletedTitle'?",
                                            () {
                                          setState(() {
                                            _filteredCardsCollection[index].updateDeleteStatus(true, widget.deck.deckId);
                                            _filteredStarredCardCollection.removeWhere((card) => card.cardId == _filteredCardsCollection[index].cardId);
                                            _filteredCardsCollection.removeAt(index);
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
                                            builder: (context) => EditFlashcardPage()),
                                      );
                                    },
                                    isStarShaded: _filteredCardsCollection[index].isStarred,
                                    onStarShaded: () {
                                      setState(() {
                                        try {
                                          _filteredCardsCollection[index].updateStarredStatus(true, widget.deck.deckId);
                                          _filteredStarredCardCollection.add(_filteredCardsCollection[index]);
                                          _filteredCardsCollection[index].isStarred = true;
                                        } catch (e) {
                                          print('star shaded error: $e');
                                        }
                                      });
                                    },
                                    onStarUnshaded: () {
                                      setState(() {
                                        try {
                                          _filteredCardsCollection[index].updateStarredStatus(false, widget.deck.deckId);
                                          _filteredStarredCardCollection.removeWhere((card) => card.cardId == _filteredCardsCollection[index].cardId);
                                          _filteredCardsCollection[index].isStarred = false;
                                        } catch (e) {
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
                    if (_filteredStarredCardCollection.isEmpty)
                      IfDeckEmpty(
                        ifDeckEmptyText: 'No Starred Flashcard(s) Available',
                        ifDeckEmptyheight: MediaQuery.of(context).size.height * 0.3,
                      )
                    else
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _filteredStarredCardCollection.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6.0),
                                child: BuildContainerOfFlashCards(
                                  titleOfFlashCard: _filteredStarredCardCollection[index].question,
                                  contentOfFlashCard: _filteredStarredCardCollection[index].answer,
                                  onDelete: () {
                                    final String starredDeletedTitle = _filteredStarredCardCollection[index].question;
                                    showConfirmationDialog(
                                      context,
                                      "Delete Item",
                                      "Are you sure you want to delete '$starredDeletedTitle'?",
                                          () {
                                        setState(() {
                                          _filteredStarredCardCollection[index].updateDeleteStatus(true, widget.deck.deckId);
                                          _filteredCardsCollection.removeWhere((card) => card.cardId == _filteredStarredCardCollection[index].cardId);
                                          _filteredStarredCardCollection.removeAt(index);
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
                                          builder: (context) => EditFlashcardPage()),
                                    );
                                  },
                                  isStarShaded: true,
                                  onStarShaded: () {
                                    //No action kasi lagi naman shaded yung andito
                                  },
                                  onStarUnshaded: () {
                                    setState(() {
                                      try {
                                        _filteredStarredCardCollection[index].updateStarredStatus(false, widget.deck.deckId);
                                        _filteredStarredCardCollection[index].isStarred = false;
                                        _filteredStarredCardCollection.removeWhere((card) => card.cardId == _filteredStarredCardCollection[index].cardId);
                                      } catch (e) {
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
