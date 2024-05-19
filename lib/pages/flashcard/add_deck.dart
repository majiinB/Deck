import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDeckPage extends StatefulWidget {
  const AddDeckPage({Key? key});

  @override
  _AddDeckPageState createState() => _AddDeckPageState();
}

class _AddDeckPageState extends State<AddDeckPage> {
  bool _isToggled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DeckBar(
        title: 'Add Deck',
        color: DeckColors.white,
        fontSize: 24,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Upload Cover Photo Of Deck (optional)',
                  style: GoogleFonts.nunito(
                    color: DeckColors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Stack(
                children: [
                  BuildCoverImage(
                      borderRadiusContainer: 10, borderRadiusImage: 10),
                  Positioned(
                      top: 140,
                      right: 10,
                      child: BuildIconButton(
                        containerWidth: 40,
                        containerHeight: 40,
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  ),
                                  child: Container(
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    color: DeckColors.gray,
                                    child: Column(children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: BuildContentOfBottomSheet(
                                          bottomSheetButtonText:
                                              'Upload Cover Photo',
                                          bottomSheetButtonIcon: Icons.image,
                                          onPressed: () {
                                            print("It is working");
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: BuildContentOfBottomSheet(
                                          bottomSheetButtonText:
                                              'Remove Cover Photo',
                                          bottomSheetButtonIcon:
                                              Icons.remove_circle,
                                          onPressed: () {
                                            print("It is working");
                                          },
                                        ),
                                      ),
                                    ]),
                                  ),
                                );
                              });
                        },
                        icon: DeckIcons.pencil,
                        iconColor: DeckColors.white,
                        backgroundColor: DeckColors.accentColor,
                      )),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: BuildTextBox(hintText: 'Enter Deck Title'),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text(
                        'AI Generated',
                        style: GoogleFonts.nunito(
                          color: DeckColors.white,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Switch(
                          value: _isToggled,
                          onChanged: (value) {
                            setState(() {
                              _isToggled = value;
                            });
                          },
                          activeColor: DeckColors.primaryColor,
                          inactiveThumbColor: DeckColors.white,
                        ),
                      ),
                    ],
                  )),
              if (_isToggled) CustomExpansionTile(),
              if (_isToggled)
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: BuildTextBox(hintText: 'Enter Subject'),
                ),
              if (_isToggled)
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: BuildTextBox(hintText: 'Enter Topic'),
                ),
              if (_isToggled)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: BuildTextBox(
                      hintText: 'Enter Description', isMultiLine: true),
                ),
              if (_isToggled)
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: BuildButton(
                        onPressed: () {},
                        buttonText: 'Upload PDF',
                        height: 50,
                        width: 150,
                        radius: 10,
                        fontSize: 16,
                        borderWidth: 0,
                        borderColor: Colors.transparent,
                        backgroundColor: DeckColors.white,
                        textColor: DeckColors.gray,
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: BuildTextBox(hintText: 'File Name'),
                    ),
                  ],
                ),
              if (_isToggled)
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: BuildTextBox(hintText: 'Enter Number Of FlashCards'),
                ),
              Padding(
                padding: EdgeInsets.only(top: 35),
                child: BuildButton(
                  onPressed: () {
                    showConfirmationDialog(context, "Generate Deck",
                        "Are you sure you want to generate deck?", () {
                      //when user clicks yes
                      //add logic here
                    }, () {
                      //when user clicks no
                      //add logic here
                    });
                  },
                  buttonText: 'Generate Deck',
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
                padding: EdgeInsets.only(top: 10),
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
          )),
    );
  }
}
