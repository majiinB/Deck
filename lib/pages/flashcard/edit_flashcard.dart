import 'package:deck/pages/flashcard/add_deck.dart';
import 'package:deck/pages/flashcard/view_deck.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:google_fonts/google_fonts.dart';

class EditFlashcardPage extends StatefulWidget {
  const EditFlashcardPage({Key? key});

  @override
  _EditFlashcardPageState createState() => _EditFlashcardPageState();
}

class  _EditFlashcardPageState extends State<EditFlashcardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthBar(
        title: 'Add New Card',
        color: DeckColors.white,
        fontSize: 24,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildTextBox(hintText: 'Enter Term', initialValue: 'Loh Putangina',),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20),
                child: BuildTextBox(hintText: 'Enter Description',
                    initialValue: 'A philosophical movement originating in the late '
                        '19th and early 20th centuries, characterized by an exploration '
                        'of the individuals subjective experience and the fundamental '
                        'nature of existence. At its core, existentialism grapples '
                        'with profound questions regarding human freedom, choice, '
                        'and responsibility in the face of a seemingly indifferent or'
                        ' absurd universe. Key figures such as Jean-Paul Sartre, '
                        'Friedrich Nietzsche, and Martin Heidegger have contributed'
                        ' seminal works that delve into the complexities of existence, '
                        'offering insights into the nature of authenticity, alienation, '
                        'and the search for meaning in a world devoid of inherent purpose.',
                    isMultiLine: true,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 35),
                child: BuildButton(
                  onPressed: () {
                    showConfirmationDialog(
                        context,
                        "Save Changes",
                        "Are you sure you want to save changes you made on this flashcard?",
                            () {//when user clicks yes
                          //add logic here
                        },
                            () { //when user clicks no
                          //add logic here
                        }
                    );
                  },
                  buttonText: 'Save Flash Card',
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  backgroundColor: DeckColors.primaryColor,
                  textColor: DeckColors.white, radius: 10.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10),
                child:BuildButton(
                  onPressed: () {
                    print("cancel button clicked");//line to test if working ung onPressedLogic XD
                    Navigator.pop(context);
                  },
                  buttonText: 'Cancel',
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  backgroundColor: DeckColors.white,
                  textColor: DeckColors.primaryColor, radius: 10.0,
                ),
              ),
            ]
        ),
      ),
    );
  }

}