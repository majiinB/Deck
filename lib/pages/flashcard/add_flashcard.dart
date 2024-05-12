import 'package:deck/pages/flashcard/add_deck.dart';
import 'package:deck/pages/flashcard/view_deck.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:google_fonts/google_fonts.dart';

class AddFlashcardPage extends StatefulWidget {
  const AddFlashcardPage({Key? key});

  @override
  _AddFlashcardPageState createState() => _AddFlashcardPageState();
}

class  _AddFlashcardPageState extends State<AddFlashcardPage> {
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
      BuildTextBox(hintText: 'Enter Term'),
      const Padding(padding: EdgeInsets.symmetric(vertical: 20),
        child: BuildTextBox(hintText: 'Enter Description', isMultiLine: true),
      ),
      Padding(padding: EdgeInsets.only(top: 35),
        child: BuildButton(
          onPressed: () {
            showConfirmationDialog(
                context,
                "Add Flash Card",
                "Are you sure you want to add this flash card on your deck?",
                    () {//when user clicks yes
                  //add logic here
                },
                    () { //when user clicks no
                  //add logic here
                }
            );
          },
          buttonText: 'Save Changes',
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