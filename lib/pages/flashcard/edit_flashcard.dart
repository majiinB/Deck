import 'package:flutter/material.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:google_fonts/google_fonts.dart';

class EditFlashcardPage extends StatefulWidget {
  const EditFlashcardPage({Key? key});

  @override
  _EditFlashcardPageState createState() => _EditFlashcardPageState();
}

class _EditFlashcardPageState extends State<EditFlashcardPage> {
  bool buttonsEnabled = false; // Flag to track button state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeckBar(
        title: 'Manage Flash Card',
        color: DeckColors.white,
        fontSize: 24,
        icon: DeckIcons.pencil,
        iconColor: Colors.white,
        onPressed: () {
          setState(() {
            buttonsEnabled = !buttonsEnabled;
          });
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Click the pencil icon above to enable editing of the text fields below.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: DeckColors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                color: DeckColors.white,
                height: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Opacity(
                opacity: buttonsEnabled
                    ? 1.0
                    : 0.7, // Set opacity based on button state
                child: IgnorePointer(
                  ignoring: !buttonsEnabled,
                  child: const BuildTextBox(
                    hintText: 'Enter Term',
                    initialValue: 'Loh Putangina',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Opacity(
                opacity: buttonsEnabled
                    ? 1.0
                    : 0.7, // Set opacity based on button state
                child: IgnorePointer(
                  ignoring: !buttonsEnabled,
                  child: const BuildTextBox(
                    hintText: 'Enter Description',
                    initialValue:
                        'A philosophical movement originating in the late '
                        '19th and early 20th centuries, characterized by an exploration '
                        'of the individual\'s subjective experience and the fundamental '
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Opacity(
                opacity: buttonsEnabled ? 1.0 : 0.7,
                child: IgnorePointer(
                  ignoring: !buttonsEnabled,
                  child: BuildButton(
                    onPressed: buttonsEnabled
                        ? () {
                            showConfirmationDialog(
                              context,
                              "Save Changes",
                              "Are you sure you want to save changes you made on this flashcard?",
                              () {
                                //when user clicks yes
                                //add logic here
                              },
                              () {
                                //when user clicks no
                                //add logic here
                              },
                            );
                          }
                        : () {}, //this line enables the button when user clicks the pencil icon, bawal kasi null e
                    buttonText: 'Save Flash Card',
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    backgroundColor: DeckColors.primaryColor,
                    textColor: DeckColors.white,
                    radius: 10.0,
                    fontSize: 16,
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: BuildButton(
                onPressed: () {
                  print(
                      "cancel button clicked"); //line to test if working ung onPressedLogic XD
                  Navigator.pop(context);
                },
                buttonText: 'Cancel',
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                backgroundColor: DeckColors.white,
                textColor: DeckColors.primaryColor,
                radius: 10.0,
                fontSize: 16,
                borderWidth: 0,
                borderColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
