
//import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:flutter/cupertino.dart';
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
/// AuthBar is an AppBar with the font Fraiche (used in auth and main routes)
class AuthBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthBar({
    super.key,
    required this.title,
    required this.color,
    required this.fontSize,
  });
  final String title;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Fraiche',
            fontSize: fontSize,
            color: color,
          ),
        ),
        centerTitle: true,
      ),
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
  final double borderRadiusContainer, borderRadiusImage;

   BuildCoverImage({Key? key, this.CoverPhotofile,
     required this.borderRadiusContainer,
     required this.borderRadiusImage}) : super(key: key);

  @override
  BuildCoverImageState createState() => BuildCoverImageState();
}
class BuildCoverImageState extends State<BuildCoverImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(widget.borderRadiusContainer),
        color: widget.CoverPhotofile != null ? null : DeckColors.coverImageColorSettings,
      ),
        child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadiusImage),
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
///
///
/// ------------------------ S T A R T -------------------------
/// ------------------ D E C K  B U T T O N --------------------

///
///
/// DeckButton is the main button of Deck used for all routes
class BuildButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double height, width, radius;
  final Color backgroundColor, textColor;
  final Color? borderColor;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Color? iconColor;
  final double? paddingIconText, size;
  final FontWeight? fontWeight;
  final MainAxisAlignment? mainAxisAlignment;

  const BuildButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.height,
    required this.width,
    required this.radius,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.fontWeight,
    this.leftIcon,
    this.rightIcon,
    this.iconColor,
    this.paddingIconText,
    this.size,
    this.mainAxisAlignment,
  });

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
            side: BorderSide(color: borderColor ?? DeckColors.backgroundColor),
          ),
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          children: [
            if (leftIcon != null)
              Padding(
                padding: EdgeInsets.only(right: paddingIconText ?? 8.0),
                child: Icon(
                  leftIcon,
                  color: iconColor,
                  size: size,
                ),
              ),
            Flexible(
              child: Text(
                buttonText,
                style: GoogleFonts.nunito(
                  fontSize: 16.0,
                  fontWeight: fontWeight ?? FontWeight.w900,
                  color: textColor,
                ),
              ),
            ),
            if (rightIcon != null)
              Padding(
                padding: EdgeInsets.only(left: paddingIconText ?? 8.0),
                child: Icon(
                  rightIcon,
                  color: iconColor,
                  size: size,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
/// -------------------------- E N D ---------------------------
/// ------------------ D E C K  B U T T O N --------------------

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
  final VoidCallback? onRetrieve, onTap;
  final bool enableSwipeToRetrieve;

  const BuildListOfDecks({
    Key? key,
    this.deckImageFile,
    required this.titleText,
    required this.numberText,
    required this.onDelete,
    this.onRetrieve,
    this.enableSwipeToRetrieve = true,
    this.onTap,
  }) : super(key: key);

  @override
  State<BuildListOfDecks> createState() => BuildListOfDecksState();
}

class BuildListOfDecksState extends State<BuildListOfDecks> {
  Color _containerColor = DeckColors.gray;

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
      child: SwipeToDeleteAndRetrieve(
        onDelete: widget.onDelete,
        onRetrieve: widget.enableSwipeToRetrieve ?   widget.onRetrieve : null,
        enableRetrieve: widget.enableSwipeToRetrieve,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: _containerColor,
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
///
///
/// ----------------------- S T A R T --------------------------
/// ------------ T E X T  F I E L D------------------
class BuildTextBox extends StatefulWidget {
  final String? hintText, initialValue;
  final bool showPassword;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final bool isMultiLine;

  const BuildTextBox({
    Key? key,
    this.hintText,
    this.showPassword = false,
    this.leftIcon,
    this.rightIcon,
    this.initialValue,
    this.isMultiLine = false,
  }) : super(key: key);

  @override
  State<BuildTextBox> createState() => BuildTextBoxState();
}

class BuildTextBoxState extends State<BuildTextBox> {
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
      maxLines: widget.isMultiLine ? null : 1,
      minLines: widget.isMultiLine ? 4 : 1,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: DeckColors.primaryColor, // Change to your desired color
            width: 2.0,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.nunito(
          fontSize: 16,
          color: Colors.amber,
        ),
        filled: true,
        fillColor: DeckColors.backgroundColor,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        prefixIcon: widget.leftIcon != null
            ? Icon(widget.leftIcon)
            : null, // Change to your desired left icon
        suffixIcon: widget.showPassword
            ? IconButton(
          icon: _obscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : widget.rightIcon != null
            ? IconButton(
          icon: Icon(widget.rightIcon),
          onPressed: () {
            // Perform action on right icon tap
          },
        )
            : null,
      ),
      obscureText: widget.showPassword ? _obscureText : false,
    );
  }
}
/// ------------------------- E N D ----------------------------
/// ------------ T E X T  F I E L D------------------

///############################################################
/*------------------ END OF PASSWORD ------------------*/



/*------------------ EDIT PROFILE ------------------*/
//icon button
class BuildIconButton extends StatelessWidget{
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor, backgroundColor;

  const BuildIconButton({super.key,
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

class BuildContentOfBottomSheet extends StatelessWidget{
  final String bottomSheetButtonText;
  final IconData bottomSheetButtonIcon;
  final VoidCallback onPressed;

  const BuildContentOfBottomSheet({super.key,
    required this.bottomSheetButtonText,
    required this.bottomSheetButtonIcon,
    required this.onPressed});
  @override
  Widget build(BuildContext context) {
      return Padding(padding: EdgeInsets.only(top: 10),
              child: BuildButton(
                onPressed: onPressed,
                buttonText: bottomSheetButtonText,
                height: 70.0,
                  borderColor: DeckColors.gray,
                width: MediaQuery.of(context).size.width,
                backgroundColor: DeckColors.gray,
                textColor: DeckColors.white, radius: 0.0,
                leftIcon: bottomSheetButtonIcon,
                iconColor: DeckColors.white,
                paddingIconText: 20.0, size: 32,
              ),
    );
  }

}
/*------------------ END OF EDIT PROFILE ------------------*/

/*------------------ FLASHCARD ------------------*/

/// THIS METHOD IS FOR THE DECKS CONTAINER IN THE FLASHCARD PAGE
class BuildDeckContainer extends StatefulWidget {
  final File? deckCoverPhoto;
  final String titleOfDeck;
  final VoidCallback onDelete,  onTap;
  final VoidCallback? onRetrieve;
  final bool enableSwipeToRetrieve;



  const BuildDeckContainer({
    Key? key,

    required this.onDelete,
    this.onRetrieve,
    this.enableSwipeToRetrieve = true, this.deckCoverPhoto, required this.titleOfDeck,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BuildDeckContainer> createState() => BuildDeckContainerState();
}

class BuildDeckContainerState extends State<BuildDeckContainer> {
  Color _containerColor = DeckColors.gray;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _containerColor = Colors.grey.withOpacity(0.7);
        });
      },
      onTapUp: (_) {
        setState(() {
          _containerColor = DeckColors.gray;
        });
        if (widget.onTap != null) {
          widget.onTap();
        }
      },
      onTapCancel: () {
        setState(() {
          _containerColor = DeckColors.gray;
        });
      },
      child: SwipeToDeleteAndRetrieve(
        onDelete: widget.onDelete,
        onRetrieve: widget.enableSwipeToRetrieve ? widget.onRetrieve : null,
        enableRetrieve: widget.enableSwipeToRetrieve,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 160,
          padding: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: _containerColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: widget.deckCoverPhoto != null ? null : DeckColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: widget.deckCoverPhoto != null
                      ? Image.file(
                    widget.deckCoverPhoto!,
                    width: 20,
                    height: 10,
                    fit: BoxFit.cover,
                  )
                      : const Placeholder(
                    color: DeckColors.white,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.titleOfDeck,
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: DeckColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DeckFAB extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;
  final Function onPressed;
  final double fontSize;
  final double borderRadius;

  const DeckFAB({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.fontSize,
    required this.onPressed,
    this.borderRadius = 30.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      verticalOffset: -13,
      margin: EdgeInsets.only(right: 65),
      message: text,
      textStyle: GoogleFonts.nunito(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: DeckColors.white,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: FloatingActionButton(
        onPressed: () => onPressed(),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        child: Icon(icon),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class ifDeckEmpty extends StatelessWidget{
  final String ifDeckEmptyText;
  final double ifDeckEmptyheight;

  const ifDeckEmpty({super.key, required this.ifDeckEmptyText,
    required this.ifDeckEmptyheight});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: ifDeckEmptyheight,
        child: Center(
          child: Text(
            ifDeckEmptyText,
            style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}


class CustomExpansionTile extends StatefulWidget {

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool customIcon = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: ExpansionTile(
                title: Text(
                    'Instructions ',
                style: GoogleFonts.nunito(
                  color: DeckColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
                ),
                trailing: Icon(
                  customIcon ?  Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded
                ),
              onExpansionChanged: (bool expanded){
                  setState(() {
                    customIcon = expanded;
                  });
              },
                tilePadding: const EdgeInsets.all(10),
                backgroundColor: DeckColors.gray,
                collapsedBackgroundColor: DeckColors.gray,
                collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: DeckColors.gray),
              ),
          
              children: <Widget>[
                ListTile(
                  title: Text(
                    '1. Provide information in the "Enter Description" text field to '
                        'guide AI in generating content for your flashcards.',
                    style: GoogleFonts.nunito(
                      color: DeckColors.white,
                      fontSize: 16,
                    ),
                  ),
                ),

                ListTile(
                  title: Text(
                    '2. Next, use the "Enter Subject" and "Enter Topic" fields to assist AI in '
                        'generating a more specific and relevant set of flashcards.',
                    style: GoogleFonts.nunito(
                      color: DeckColors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    '3. Optionally, if you want to upload a PDF instead; just upload your existing PDF and '
                        'it will prompt the application to automatically generate flashcards for you.',
                    style: GoogleFonts.nunito(
                      color: DeckColors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    '4.  Ensure that you specified the number of flashcards you desire'
                        ' for the AI to generate.',
                    style: GoogleFonts.nunito(
                      color: DeckColors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Note: You have the ability to employ both features simultaneously. Moreover, rest assured that AI-generated flashcards content can be edited by the user.',
                    style: GoogleFonts.nunito(
                      color: DeckColors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
        ),
      ],
    );
  }
  }

///
///
/// ----------------------- S T A R T --------------------------
/// ------------ T A B  B A R ------------------
class BuildTabBar extends StatelessWidget {
  final List<String> titles;
  final int length;
  final List<Widget> tabContent;

  const BuildTabBar({
    Key? key,
    required this.titles,
    required this.length,
    required this.tabContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: length,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: DeckColors.accentColor,
              ),
              child: TabBar(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: DeckColors.gray,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelColor: DeckColors.white,
                unselectedLabelColor: DeckColors.white,
                tabs: buildTabs(),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
                children: tabContent,
              ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildTabs() {
    return titles.map((title) {
      return buildContentTabBar(title: title);
    }).toList();
  }

  Widget buildContentTabBar({required String title}) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
/// ------------------------- E N D ----------------------------
/// ------------ T A B  B A R------------------

///############################################################

///
///
/// ----------------------- S T A R T --------------------------
/// ------------ C O N T A I N E R  O F  E A C H  F L A S H C A R D ------------------

class BuildContainerOfFlashCards extends StatefulWidget {
  final VoidCallback onDelete;
  final VoidCallback? onRetrieve, onTap;
  final bool enableSwipeToRetrieve;
  final String titleOfFlashCard, contentOfFlashCard;
  bool isStarShaded;
  final VoidCallback onStarShaded;
  final VoidCallback onStarUnshaded;

   BuildContainerOfFlashCards({
    Key? key,
    required this.onDelete,
    required this.isStarShaded,
    required this.onStarShaded,
    required this.onStarUnshaded,
    this.onRetrieve,
    required this.enableSwipeToRetrieve,
    required this.titleOfFlashCard,
    required this.contentOfFlashCard,
    this.onTap,
  }) : super(key: key);

  @override
  State<BuildContainerOfFlashCards> createState() => BuildContainerOfFlashCardsState();
}

class BuildContainerOfFlashCardsState extends State<BuildContainerOfFlashCards> with SingleTickerProviderStateMixin {
  Color _containerColor = DeckColors.gray;

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
      child: SwipeToDeleteAndRetrieve(
        onDelete: widget.onDelete,
        onRetrieve: widget.enableSwipeToRetrieve ? widget.onRetrieve : null,
        enableRetrieve: widget.enableSwipeToRetrieve,
        child: Container(
          height: 200,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: _containerColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.titleOfFlashCard,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: DeckColors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle the state of isStarShaded
                        widget.isStarShaded = !widget.isStarShaded;
                        if (widget.isStarShaded) {
                          widget.onStarShaded();
                        } else {
                          widget.onStarUnshaded();
                        }
                      });
                    },
                    child: Icon(
                      size: 32,
                      widget.isStarShaded ? Icons.star : Icons.star_border,
                      color: widget.isStarShaded ? DeckColors.primaryColor : DeckColors.primaryColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  widget.contentOfFlashCard,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: DeckColors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// ------------------------- E N D ----------------------------
/// ------------ C O N T A I N E R  O F  E A C H  F L A S H C A R D------------------
/*------------------ END OF FLASHCARD ------------------*/

