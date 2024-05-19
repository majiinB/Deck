import 'package:deck/pages/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:google_fonts/google_fonts.dart';

class AddFlashcardPage extends StatefulWidget {
  const AddFlashcardPage({Key? key});

  @override
  _AddFlashcardPageState createState() => _AddFlashcardPageState();
}

class _AddFlashcardPageState extends State<AddFlashcardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DeckBar(
        title: 'Add Flash Card',
        color: DeckColors.white,
        fontSize: 24,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Simply fill in the text fields below to add flash card on your deck.',
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
          const Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: BuildTextBox(hintText: 'Enter Term'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child:
                BuildTextBox(hintText: 'Enter Description', isMultiLine: true),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35),
            child: BuildButton(
              onPressed: () {
                showConfirmationDialog(context, "Add Flash Card",
                    "Are you sure you want to add this flash card on your deck?",
                    () {
                  //when user clicks yes
                  //add logic here
                }, () {
                  //when user clicks no
                  //add logic here
                });
              },
              buttonText: 'Save Changes',
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
        ]),
      ),
    );
  }
}
