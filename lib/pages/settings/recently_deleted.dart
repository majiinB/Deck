import 'package:deck/backend/flashcard/flashcard_utils.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../backend/auth/auth_service.dart';
import '../../backend/flashcard/flashcard_service.dart';
import '../../backend/models/deck.dart';

class RecentlyDeletedPage extends StatefulWidget {
  const RecentlyDeletedPage({super.key});

  @override
  State<RecentlyDeletedPage> createState() => RecentlyDeletedPageState();
}

class RecentlyDeletedPageState extends State<RecentlyDeletedPage> {
  final AuthService _authService = AuthService();
  final FlashcardService _flashcardService = FlashcardService();
  List<Deck> _decks = [];
  List<Deck> _filteredDecks = [];
  Map<String, int> _deckCardCount = {};
  late User? _user;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  void initState() {
    super.initState();
    _user = _authService.getCurrentUser();
    _initUserDecks(_user);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _initUserDecks(User? user) async {
    if (user != null) {
      String userId = user.uid;
      List<Deck> decks = await _flashcardService.getDeletedDecksByUserId(userId); // Call method to fetch decks
      Map<String, int> deckCardCount = {};
      for(Deck deckCount in decks){
        int count = await deckCount.getCardCount();
        deckCardCount[deckCount.deckId] = count;
      }
      setState(() {
        _decks = decks; // Update state with fetched decks
        _filteredDecks = decks; // Initialize filtered decks
        _deckCardCount = deckCardCount; // Update state with fetched decks count
      });
    }
  }
  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
      _filteredDecks = _decks
          .where((deck) =>
          deck.title.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthBar(
        automaticallyImplyLeading: true,
        title: 'Recently Deleted',
        color: DeckColors.primaryColor,
        fontSize: 24,
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildTextBox(
              hintText: 'Search Decks',
              controller: _searchController,
              showPassword: false,
              leftIcon: Icons.search,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: BuildButton(
                onPressed: () {
                  showConfirmationDialog(
                    context,
                    "Are you sure you want to delete all items?",
                    "Note: Once you delete the item(s) included, you will no longer be able to retrieve it. Proceed with caution.",
                    () async{
                      for (Deck deck in List.from(_decks)) {
                        if (await _flashcardService.deleteDeck(deck.deckId)) {
                          _decks.removeWhere((d) => d.deckId == deck.deckId);
                        } else {
                          continue;
                        }
                      }
                      setState(() {
                        _filteredDecks = _decks;
                      });
                      FlashcardUtils.updateSettingsNeeded.value = true;
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
                borderColor: Colors.amber,
                fontSize: 16,
                borderWidth: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _filteredDecks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: BuildListOfDecks(
                      deckImageUrl: _filteredDecks[index].coverPhoto.toString(),
                      titleText: _filteredDecks[index].title.toString(),
                      numberText: _deckCardCount[_filteredDecks[index].deckId].toString() + " Card(s)",
                      onDelete: () {
                        String deletedTitle = _filteredDecks[index].title.toString();
                        Deck removedDeck =  _filteredDecks[index];
                        _decks.removeAt(index);
                        showConfirmationDialog(
                          context,
                          "Delete Item",
                          "Are you sure you want to delete '$deletedTitle'?",
                          () {
                            setState(() {
                              FlashcardService _flashCardService = FlashcardService();
                              _flashCardService.deleteDeck(removedDeck.deckId);
                              FlashcardUtils.updateSettingsNeeded.value = true;
                            });
                          },
                          () {
                            setState(() {
                              _decks.insert(index, removedDeck);
                              FlashcardUtils.updateSettingsNeeded.value = true;
                            });
                          },
                        );
                      },
                      onRetrieve: () {
                        final String retrievedTitle = _filteredDecks[index].title.toString();
                        Deck retrievedDeck = _filteredDecks[index];
                        _decks.removeAt(index);
                        showConfirmationDialog(
                          context,
                          "Retrieve Item",
                          "Are you sure you want to retrieve '$retrievedTitle'?",
                          () {
                             setState(() {
                               retrievedDeck.updateDeleteStatus(false);
                               FlashcardUtils.updateSettingsNeeded.value = true;
                             });
                          },
                          () {
                            setState(() {
                              _decks.insert(index, retrievedDeck);
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
