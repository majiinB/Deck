import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deck/backend/auth/auth_service.dart';
import 'package:deck/backend/auth/auth_utils.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:deck/pages/misc/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../backend/profile/profile_utils.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  final TextEditingController firstNameController = TextEditingController(text: AuthUtils().getFirstName());
  final TextEditingController lastNameController = TextEditingController(text: AuthUtils().getLastName());
  final TextEditingController emailController = TextEditingController(text: AuthUtils().getEmail());

  XFile? pfpFile, coverFile;
  late Image? photoUrl, coverUrl;

  @override
  void initState() {
    super.initState();
    photoUrl = AuthUtils().getPhoto();
    coverUrl = null;
    getCoverUrl();
  }

  void getCoverUrl() async {
    coverUrl = await AuthUtils().getCoverPhotoUrl();
  }

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
                BuildCoverImage(borderRadiusContainer: 0, borderRadiusImage: 0, CoverPhotofile: coverUrl,),
                Positioned(
                  top: 150,
                  left: 10,
                  child: BuildProfileImage(photoUrl),
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
                                    onPressed: () async {
                                      ImagePicker imagePicker = ImagePicker();
                                      XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                                      if(file == null) return;
                                      setState(() {
                                        coverUrl = Image.file(File(file!.path));
                                      });
                                      coverFile = file;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: BuildContentOfBottomSheet(
                                    bottomSheetButtonText: 'Remove Cover Photo',
                                    bottomSheetButtonIcon: Icons.remove_circle,
                                    onPressed: () {
                                      setState(() {
                                        coverUrl = null;
                                      });
                                      coverFile = null;
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
                                  onPressed: () async {
                                    ImagePicker imagePicker = ImagePicker();
                                    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                                    if(file == null) return;
                                    setState(() {
                                      photoUrl = Image.file(File(file!.path));
                                    });
                                    pfpFile = file;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: BuildContentOfBottomSheet(
                                  bottomSheetButtonText: 'Remove Profile Photo',
                                  bottomSheetButtonIcon: Icons.remove_circle,
                                  onPressed: () {
                                    setState(() {
                                      photoUrl = null;
                                    });
                                    pfpFile = null;
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
              child: BuildTextBox(showPassword: false, hintText: "First Name", controller: firstNameController,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              child: BuildTextBox(showPassword: false, hintText: "Last Name", controller: lastNameController,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              child: BuildTextBox(
                  showPassword: false,
                  hintText: "Email",
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
                    () async {
                      User? user = AuthService().getCurrentUser();
                      String newName = '';
                      if(lastNameController.text.isEmpty){
                        newName = firstNameController.text;
                      } else {
                        newName = "${firstNameController.text} ${lastNameController.text}";
                      }
                      String uniqueFileName = '${AuthService().getCurrentUser()?.uid}';
                      try {

                        if(user?.displayName != newName){
                          user?.updateDisplayName(newName);
                        }

                        if(user?.email != emailController.text){
                          user?.updateEmail(emailController.text);
                        }

                        Reference refRoot = FirebaseStorage.instance.ref();
                        if (pfpFile != null) {
                          Reference refDirPfpImg = refRoot.child('userProfiles/${AuthService().getCurrentUser()?.uid}');
                          Reference refPfpUpload = refDirPfpImg.child(uniqueFileName);

                          bool pfpExists = await ProfileUtils().doesFileExist(refPfpUpload);
                          if(pfpExists) return;

                          await refPfpUpload.putFile(File(pfpFile!.path));
                          String photoUrl = await refPfpUpload.getDownloadURL();
                          await AuthService().getCurrentUser()?.updatePhotoURL(photoUrl);
                        }

                        if (coverFile != null) {
                          Reference refDirCoverImg = refRoot.child('userCovers/${AuthService().getCurrentUser()?.uid}');
                          Reference refCoverUpload = refDirCoverImg.child(uniqueFileName);
                          bool coverExists = await ProfileUtils().doesFileExist(refCoverUpload);
                          if(coverExists) return;
                          await refCoverUpload.putFile(File(coverFile!.path));
                          String photoCover = await refCoverUpload.getDownloadURL();

                          final db = FirebaseFirestore.instance;
                          var querySnapshot = await db.collection('users').where('email', isEqualTo: AuthUtils().getEmail()).limit(1).get();

                          // Check if the document exists
                          if (querySnapshot.docs.isNotEmpty) {
                            var doc = querySnapshot.docs.first;
                            String docId = doc.id;

                            // Update the existing document with the new field
                            await db.collection('users').doc(docId).update({'cover_photo': photoCover,});
                          } else {
                            print('Document not found');
                          }
                        }
                      } catch (e) {
                        print(e);
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
                  print("cancel button clicked"); //line to test if working ung onPressedLogic XD
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
