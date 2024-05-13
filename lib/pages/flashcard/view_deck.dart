import 'package:deck/pages/flashcard/add_flashcard.dart';
import 'package:deck/pages/flashcard/edit_flashcard.dart';
import 'package:deck/pages/flashcard/play_my_deck.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewDeckPage extends StatefulWidget {
  const ViewDeckPage({Key? key});

  @override
  _ViewDeckPageState createState() => _ViewDeckPageState();
}

class  _ViewDeckPageState extends State<ViewDeckPage> {
  List<String> flashCardTitles = [
    'Tanga tanga amp',
    'Loh putangina',
    'Tangina ng bumoto kay bbm',
  ];

  List<String> flashCardContent = [
    'have a shared goal that everyone knows',
    'tanginamong hayup ka may pamilya na yung tao kumekerengkeng ka pa raffy tulfo meme',
    'A philosophical movement originating in the late 19th and early 20th centuries, characterized by an exploration of the individuals subjective experience and the fundamental nature of existence. At its core, existentialism grapples with profound questions regarding human freedom, choice, and responsibility in the face of a seemingly indifferent or absurd universe. Key figures such as Jean-Paul Sartre, Friedrich Nietzsche, and Martin Heidegger have contributed seminal works that delve into the complexities of existence, offering insights into the nature of authenticity, alienation, and the search for meaning in a world devoid of inherent purpose.'
  ];

  List<String> starredFlashCardTitles = [
    'Tanga tanga amp',
    'Loh putangina',
    'Tangina ng bumoto kay bbm',
  ];

  List<String> starredFlashCardContent = [
    'have a shared goal that everyone knows',
    'tanginamong hayup ka may pamilya na yung tao kumekerengkeng ka pa raffy tulfo meme',
    'A philosophical movement originating in the late 19th and early 20th centuries, characterized by an exploration of the individuals subjective experience and the fundamental nature of existence. At its core, existentialism grapples with profound questions regarding human freedom, choice, and responsibility in the face of a seemingly indifferent or absurd universe. Key figures such as Jean-Paul Sartre, Friedrich Nietzsche, and Martin Heidegger have contributed seminal works that delve into the complexities of existence, offering insights into the nature of authenticity, alienation, and the search for meaning in a world devoid of inherent purpose.'
  ];
  @override
  Widget build(BuildContext context) {
    double topPadding = (starredFlashCardTitles.isNotEmpty || flashCardTitles.isNotEmpty) ? 20.0 : 40.0;
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
        'Deck ni Leila 101 ',
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
        child: BuildButton(onPressed: (){
          print("Laruin mo deck ko");
           Navigator.push(
            context,
             MaterialPageRoute(builder: (context) => PlayMyDeckPage()),
           );
        },
            buttonText: 'Play My Deck',
            height: 35, width: 180,
            radius: 20,
            backgroundColor: DeckColors.primaryColor, textColor: DeckColors.white
        ),
      ),

      if (flashCardTitles.isNotEmpty || starredFlashCardTitles.isNotEmpty)
      const Padding(
        padding: EdgeInsets.only(top: 40.0),
        child: BuildTextBox(hintText: 'Search Flashcard', showPassword: false, rightIcon: Icons.search,),
      ),
      Padding(
        padding:  EdgeInsets.only(top: topPadding),
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
              if (flashCardTitles.isEmpty)
                ifDeckEmpty(ifDeckEmptyText: 'No Flashcard(s) Available',
                  ifDeckEmptyheight: MediaQuery.of(context).size.height * 0.3,
                ),
              if(flashCardTitles.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.only(top: 20.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: flashCardTitles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: BuildContainerOfFlashCards(
                            titleOfFlashCard: flashCardTitles[index],
                            contentOfFlashCard: flashCardContent[index],
                            onDelete: () {
                              final String deletedTitle = flashCardTitles[index];
                              final String deletedNumber = flashCardContent[index];
                              showConfirmationDialog(
                                context,
                                "Delete Item",
                                "Are you sure you want to delete '$deletedTitle'?",
                                    () {
                                  setState(() {

                                    final int starredIndex = starredFlashCardTitles.indexOf(deletedTitle);

                                    if (starredIndex != -1) {
                                      starredFlashCardTitles.removeAt(starredIndex);
                                      starredFlashCardContent.removeAt(starredIndex);
                                    }

                                    setState(() {
                                      flashCardTitles.removeAt(index);
                                      flashCardContent.removeAt(index);
                                    });
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
                              MaterialPageRoute(builder: (context) => EditFlashcardPage()),
                            );
                          },
                            isStarShaded: false,
                            onStarShaded: () {
                              print ("yey");
                            },
                            onStarUnshaded: () {
                              print ("aww");
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
              if (starredFlashCardTitles.isEmpty)
                ifDeckEmpty(ifDeckEmptyText: 'No Starred Flashcard(s) Available',
                  ifDeckEmptyheight: MediaQuery.of(context).size.height * 0.3,
                ),
              if(starredFlashCardTitles.isNotEmpty)
              SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(top: 20.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: starredFlashCardTitles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: BuildContainerOfFlashCards(
                          titleOfFlashCard: starredFlashCardTitles[index],
                          contentOfFlashCard: starredFlashCardContent[index],
                          onDelete: () {
                            final String starredDeletedTitle = starredFlashCardTitles[index];
                            final String starredDeletedNumber = starredFlashCardContent[index];

                            showConfirmationDialog(
                              context,
                              "Delete Item",
                              "Are you sure you want to delete '$starredDeletedTitle'?",
                                  () {
                                setState(() {
                                  starredFlashCardTitles.removeAt(index);
                                  starredFlashCardContent.removeAt(index);
                                });
                              },
                                  () {
                                setState(() {//when the user clicks no

                                });
                              },
                            );
                          }, enableSwipeToRetrieve: false,
                          onTap: () {
                          print("Clicked");
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditFlashcardPage()),
                           );
                        },
                          isStarShaded: true,
                          onStarShaded: () {
                            print ("yey");
                          },
                          onStarUnshaded: () {
                            print ("aww");
                                setState(() {
                                  starredFlashCardTitles.removeAt(index);
                                  starredFlashCardContent.removeAt(index);
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
