import 'package:deck/backend/auth/auth_service.dart';
import 'package:deck/backend/auth/auth_utils.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  final TextEditingController firstNameController = TextEditingController(text: AuthUtils().getFirstName());
  final TextEditingController lastNameController = TextEditingController(text: AuthUtils().getLastName());
  final TextEditingController emailController = TextEditingController(text: AuthUtils().getEmail());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DeckBar(
        title: 'Edit Account Information',
        color: DeckColors.white,
        fontSize: 24,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                BuildCoverImage(borderRadiusContainer: 0, borderRadiusImage: 0),
                Positioned(
                  top: 150,
                  left: 10,
                  child: BuildProfileImage(AuthUtils().getPhoto()),
                ),
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
                                  padding: const EdgeInsets.only(top: 10),
                                  child: BuildContentOfBottomSheet(
                                    bottomSheetButtonText: 'Upload Cover Photo',
                                    bottomSheetButtonIcon: Icons.image,
                                    onPressed: () {
                                      print("It is working");
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: BuildContentOfBottomSheet(
                                    bottomSheetButtonText: 'Remove Cover Photo',
                                    bottomSheetButtonIcon: Icons.remove_circle,
                                    onPressed: () {
                                      print("It is working");
                                    },
                                  ),
                                ),
                              ]),
                            ),
                          );
                        },
                      );
                    },
                    icon: DeckIcons.pencil,
                    iconColor: DeckColors.white,
                    backgroundColor: DeckColors.accentColor,
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 25, left: 100),
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
                                padding: const EdgeInsets.only(top: 10),
                                child: BuildContentOfBottomSheet(
                                  bottomSheetButtonText: 'Upload Profile Photo',
                                  bottomSheetButtonIcon: Icons.image,
                                  onPressed: () {
                                    print("It is working");
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: BuildContentOfBottomSheet(
                                  bottomSheetButtonText: 'Remove Profile Photo',
                                  bottomSheetButtonIcon: Icons.remove_circle,
                                  onPressed: () {
                                    print("It is working");
                                  },
                                ),
                              ),
                            ]),
                          ),
                        );
                      },
                    );
                  },
                  icon: DeckIcons.pencil,
                  iconColor: DeckColors.white,
                  backgroundColor: DeckColors.accentColor,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
              child: BuildTextBox(showPassword: false, controller: firstNameController,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              child: BuildTextBox(showPassword: false, controller: lastNameController,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              child: BuildTextBox(
                  showPassword: false,
                  controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              child: BuildButton(
                onPressed: () {
                  print(
                      "save button clicked"); //line to test if working ung onPressedLogic XD
                  showConfirmationDialog(
                    context,
                    "Save Account Information",
                    "Are you sure you want to change your account information?",
                    () {
                      User? user = AuthService().getCurrentUser();
                      String newName = '';
                      if(lastNameController.text.isEmpty){
                        newName = firstNameController.text;
                      } else {
                        newName = "${firstNameController.text} ${lastNameController.text}";
                      }
                      if(user?.displayName != newName){
                        user?.updateDisplayName(newName);
                      }

                      if(user?.email != emailController.text){
                          user?.verifyBeforeUpdateEmail(emailController.text);
                      }
                    },
                    () {
                      //when user clicks no
                      //add logic here
                    },
                  );
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
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
