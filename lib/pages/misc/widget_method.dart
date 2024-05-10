
//import 'dart:ffi';
import 'dart:io';

import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_svg/flutter_svg.dart';

///
///
///
/// A P P B A R

/// DefaultHome is the Home Page by default in Deck
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'deck',
        style: TextStyle(fontFamily: 'Fraiche', fontSize: 24),
      ),
      foregroundColor: DeckColors.primaryColor,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

///
///
/// TaskPage is the Todo List Page in Deck
class TaskAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TaskAppBar({super.key});

  @override
  State<TaskAppBar> createState() => _TaskAppBarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _TaskAppBarState extends State<TaskAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Task Page',
        style: GoogleFonts.nunito(
            fontSize: 24, fontWeight: FontWeight.w900, color: DeckColors.white),
      ),
      centerTitle: true,
      foregroundColor: const Color.fromARGB(255, 61, 61, 61),
      // leading: GestureDetector(
      //   onTap: () {
      //     Navigator.pop(context);
      //   },
      //   child: const Icon(
      //     DeckIcons.backArrow,
      //     size: 24,
      //   ),
      // ),
    );
  }
}

///
///
/// Navbar with Back Button Plain
class BackButtonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackButtonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Hi'),
      foregroundColor: Colors.green,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}


/*------------------ACCOUNT------------------*/
//cover photo
class BuildCoverImage extends StatefulWidget {
  final File? CoverPhotofile;

   BuildCoverImage({Key? key, this.CoverPhotofile}) : super(key: key);

  @override
  BuildCoverImageState createState() => BuildCoverImageState();
}
class BuildCoverImageState extends State<BuildCoverImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.CoverPhotofile != null ? null : DeckColors.coverImageColorSettings,
      height: 200,
      child: widget.CoverPhotofile != null
          ? Image.file(
        widget.CoverPhotofile!,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      )
          : const Placeholder(
        color: DeckColors.coverImageColorSettings,
      ),
    );
  }
}

//profile photo
class BuildProfileImage extends StatefulWidget {
  final File? profilePhotofile;

   BuildProfileImage({Key? key, this.profilePhotofile}) : super(key: key);

  @override
  BuildProfileImageState createState() => BuildProfileImageState();
}

class BuildProfileImageState extends State<BuildProfileImage> {

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: widget.profilePhotofile != null ? null : DeckColors.white,
      backgroundImage: widget.profilePhotofile != null ? FileImage(widget.profilePhotofile!) : null,
      child: widget.profilePhotofile == null ? Icon(DeckIcons.account, size: 60, color: DeckColors.backgroundColor) : null,
      radius: 60,
    );
  }
}

//button
class buildButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double height, width, radius;
  final Color backgroundColor, textColor;
  final IconData? icon;
  final Color? iconColor;
  final double? paddingIconText, size;

  const buildButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.height,
    required this.width,
    required this.radius,
    required this.backgroundColor,
    required this.textColor,
    this.icon, this.iconColor, this.paddingIconText, this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(padding: EdgeInsets.only(right: paddingIconText ?? 8.0),
              child: Icon(
                icon,
                color: iconColor,
                size: size,
              ),
    ),
            Text(
              buttonText,
              style: GoogleFonts.nunito(
                fontSize: 16.0,
                fontWeight: FontWeight.w900,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//swipe to deleteAndRetrieve
class SwipeToDeleteAndRetrieve extends StatelessWidget {
  final Widget child;
  final VoidCallback onDelete;
  final VoidCallback? onRetrieve;
  final bool enableRetrieve;

  const SwipeToDeleteAndRetrieve({
    Key? key,
    required this.child,
    required this.onDelete,
    this.onRetrieve,
    this.enableRetrieve = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: enableRetrieve ? DismissDirection.horizontal : DismissDirection.endToStart,
      background: enableRetrieve ? Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: DeckColors.primaryColor,
        ),
        child: const Icon(Icons.undo, color: DeckColors.white),
      ) : Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red,
        ),
        child: Icon(DeckIcons.trash_bin, color: DeckColors.white),
      ),
      secondaryBackground: enableRetrieve ? Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red, // Red background for delete
        ),
        child: Icon(DeckIcons.trash_bin, color: DeckColors.white),
      ) : null,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onDelete();
        } else if (direction == DismissDirection.startToEnd && enableRetrieve) {
          onRetrieve?.call();
        }
      },
      child: child,
    );
  }
}



//container ng decks, design lang i2 nung container
class BuildListOfDecks extends StatefulWidget {
  final File? deckImageFile;
  final String titleText, numberText;
  final VoidCallback onDelete;
  final VoidCallback? onRetrieve;
  final bool enableSwipeToRetrieve;

  const BuildListOfDecks({
    Key? key,
    this.deckImageFile,
    required this.titleText,
    required this.numberText,
    required this.onDelete,
    this.onRetrieve,
    this.enableSwipeToRetrieve = true,
  }) : super(key: key);

  @override
  State<BuildListOfDecks> createState() => BuildListOfDecksState();
}

class BuildListOfDecksState extends State<BuildListOfDecks> {


  @override
  Widget build(BuildContext context) {
    return SwipeToDeleteAndRetrieve(
      onDelete: widget.onDelete,
      onRetrieve: widget.enableSwipeToRetrieve ?   widget.onRetrieve : null,
      enableRetrieve: widget.enableSwipeToRetrieve,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: DeckColors.gray,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: widget.deckImageFile != null ? null : DeckColors.white,
              height: 75,
              width: 75,
              child: widget.deckImageFile != null
                  ? Image.file(
                widget.deckImageFile!,
                width: 20,
                height: 10,
                fit: BoxFit.cover,
              )
                  : const Placeholder(
                color: DeckColors.white,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.titleText,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: DeckColors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7.0),
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: DeckColors.coverImageColorSettings,
                        ),
                        child: Text(
                          widget.numberText,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            color: DeckColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//dialog box
class ShowConfirmationDialog extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  ShowConfirmationDialog({
    required this.title,
    required this.text,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            onCancel();
            Navigator.of(context).pop();
          },
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop();
          },
          child: const Text("Yes"),
        ),
      ],
    );
  }
}

//used to show the dialog box
void showConfirmationDialog(BuildContext context, String title, String text, VoidCallback onConfirm, VoidCallback onCancel) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ShowConfirmationDialog(
        title: title,
        text: text,
        onConfirm: onConfirm,
        onCancel: onCancel,
      );
    },
  );
}

/*------------------ END OF ACCOUNT ------------------*/


/*------------------ SETTINGS ------------------*/

//container
class BuildContainer extends StatefulWidget {
  final IconData selectedIcon;
  final IconData? alternateIcon;
  final String nameOfTheContainer;
  final String? alternateText;
  final VoidCallback? onTap;
  final bool showSwitch, showArrow;

  const BuildContainer({
    required this.selectedIcon,
    required this.nameOfTheContainer,
    this.alternateIcon,
    this.alternateText,
    this.showSwitch = false,
    this.showArrow = false,
    this.onTap,
    Key? key,
  })  : assert(showSwitch == false || (alternateIcon != null && alternateText != null),
  ),
        super(key: key);

  @override
  State<BuildContainer> createState() => _BuildContainerState();
}

class _BuildContainerState extends State<BuildContainer> {
  late bool _isToggled;
  Color _containerColor = DeckColors.gray;

  @override
  void initState() {
    super.initState();
    _isToggled = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          if (widget.onTap != null) {
            _containerColor = Colors.grey.withOpacity(0.7);
          }
        });
      },
      onTapUp: (_) {
        setState(() {
          _containerColor = DeckColors.gray;
        });
        widget.onTap?.call();
      },
      onTapCancel: () {
        setState(() {
          _containerColor = DeckColors.gray;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: _containerColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  _isToggled ? widget.alternateIcon! : widget.selectedIcon,
                  color: _isToggled ? DeckColors.primaryColor : DeckColors.primaryColor,
                  size: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    _isToggled ? widget.alternateText! : widget.nameOfTheContainer,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: _isToggled ? Colors.white : DeckColors.white,
                    ),
                  ),
                ),
              ],
            ),
            if (widget.showSwitch)
              Switch(
                value: _isToggled,
                onChanged: (value) {
                  setState(() {
                    _isToggled = value;
                  });
                },
                activeColor: DeckColors.primaryColor,
                inactiveThumbColor: DeckColors.gray,
              ),
            if (widget.showArrow)
              const Icon(Icons.arrow_right, color: DeckColors.coverImageColorSettings, size: 32,),
          ],
        ),
      ),
    );
  }
}
/*------------------ END OF SETTINGS ------------------*/

/*------------------ CHANGE PASSWORD ------------------*/
class buildTextBox extends StatefulWidget {
  final String? hintText, initialValue;
  final bool showPassword;
  final IconData? icon;


  const buildTextBox({
    Key? key,
    this.hintText,
    this.showPassword = false,
    this.icon, this.initialValue,
  }) : super(key: key);

  @override
  State<buildTextBox> createState() => buildTextBoxState();
}

class buildTextBoxState extends State<buildTextBox> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      initialValue: widget.initialValue,
      style: GoogleFonts.nunito(
        color: Colors.white,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: DeckColors.white,
            width: 3.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: DeckColors.primaryColor,
            width: 3.0,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.nunito(
          fontSize: 16,
          color: Colors.white,
        ),
        filled: true,
        fillColor: DeckColors.gray,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        suffixIcon: widget.showPassword
            ? IconButton(
          icon: _obscureText
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ) : (widget.icon != null
            ? Icon(widget.icon)
            : null),
      ),
      obscureText: widget.showPassword ? _obscureText : false,
    );
  }
}
/*------------------ END OF PASSWORD ------------------*/



/*------------------ EDIT PROFILE ------------------*/
//icon button
class buildIconButton extends StatelessWidget{
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor, backgroundColor;

  const buildIconButton({super.key,
    required this.onPressed,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: IconButton(
        icon:  Icon(icon, color: iconColor),
        onPressed: onPressed,
      ),
    );
  }

}
/*------------------ END OF EDIT PROFILE ------------------*/
