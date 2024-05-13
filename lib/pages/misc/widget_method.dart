import 'dart:io';
import 'package:deck/pages/misc/colors.dart';
import 'package:deck/pages/misc/deck_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

///
///
/// ----------------------- S T A R T -------------------------
/// ---------------------- A P P B A R ------------------------

///
///
/// DeckBar is an AppBar with the font Nunito (used in typical routes)
class DeckBar extends StatelessWidget implements PreferredSizeWidget {
  const DeckBar({
    super.key,
    required this.title,
    required this.color,
    required this.fontSize,
    this.onPressed,
    this.icon,
    this.iconColor,
  }); // Correct usage of super keyword

  final String title;
  final Color color;
  final double fontSize;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final IconData? icon; // Make IconData nullable

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];
    if (icon != null) {
      // Check if icon is not null
      actions.add(
        InkWell(
          onTap: onPressed,
          borderRadius:
          BorderRadius.circular(50), // Adjust the border radius as needed
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Adjust padding as needed
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
        ),
      );
      actions.add(const SizedBox(width: 10));
    }

    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.nunito(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: color,
        ),
      ),
      centerTitle: true,
      foregroundColor: const Color.fromARGB(255, 61, 61, 61),
      actions: actions, // Use the constructed list of actions
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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

/// ------------------------- E N D ---------------------------
/// ---------------------- A P P B A R ------------------------

///############################################################

///
///
/// ------------------------ S T A R T -------------------------
/// -------------- R O U T E  A N I M A T I O N ----------------

///
///
/// RouteGenerator is a widget that handles the animation of pages
class RouteGenerator {
  static Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Animation starts from right to left
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

/// -------------------------- E N D ---------------------------
/// -------------- R O U T E  A N I M A T I O N ----------------

///############################################################

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

///############################################################

///
///
/// ------------------------ S T A R T -------------------------
/// ---------------------- A C C O U N T -----------------------

///
///
/// BuildCoverImage is a method for Cover Photo
class BuildCoverImage extends StatefulWidget {
  final File? coverPhotofile;

  const BuildCoverImage({
    super.key,
    required this.coverPhotofile,
  });

  @override
  BuildCoverImageState createState() => BuildCoverImageState();
}

class BuildCoverImageState extends State<BuildCoverImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.coverPhotofile != null
          ? null
          : DeckColors.coverImageColorSettings,
      height: 200,
      child: widget.coverPhotofile != null
          ? Image.file(
        widget.coverPhotofile!,
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

///
///
/// BuildProfileImage is a method for Profile Photo
class BuildProfileImage extends StatefulWidget {
  final File? profilePhotofile;

  const BuildProfileImage({
    super.key,
    required this.profilePhotofile,
  });

  @override
  BuildProfileImageState createState() => BuildProfileImageState();
}

class BuildProfileImageState extends State<BuildProfileImage> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
      widget.profilePhotofile != null ? null : DeckColors.white,
      backgroundImage: widget.profilePhotofile != null
          ? FileImage(widget.profilePhotofile!)
          : null,
      radius: 60,
      child: widget.profilePhotofile == null
          ? const Icon(
        DeckIcons.account,
        size: 60,
        color: DeckColors.backgroundColor,
      )
          : null,
    );
  }
}

///
///
///SwipeToDeleteAndRetrieve is to delete and retrieve Decks
class SwipeToDeleteAndRetrieve extends StatelessWidget {
  final Widget child;
  final VoidCallback onDelete;
  final VoidCallback? onRetrieve;
  final bool enableRetrieve;

  const SwipeToDeleteAndRetrieve({
    super.key,
    required this.child,
    required this.onDelete,
    this.onRetrieve,
    this.enableRetrieve = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: enableRetrieve
          ? DismissDirection.horizontal
          : DismissDirection.endToStart,
      background: enableRetrieve
          ? Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: DeckColors.primaryColor,
        ),
        child: const Icon(Icons.undo, color: DeckColors.white),
      )
          : Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red,
        ),
        child: Icon(DeckIcons.trash_bin, color: DeckColors.white),
      ),
      secondaryBackground: enableRetrieve
          ? Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red, // Red background for delete
        ),
        child: Icon(DeckIcons.trash_bin, color: DeckColors.white),
      )
          : null,
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

///
///
///BuidListOfDecks is a method for Container of Decks but only for design
class BuildListOfDecks extends StatefulWidget {
  final File? deckImageFile;
  final String titleText, numberText;
  final VoidCallback onDelete;
  final VoidCallback? onRetrieve;
  final bool enableSwipeToRetrieve;

  const BuildListOfDecks({
    super.key,
    this.deckImageFile,
    required this.titleText,
    required this.numberText,
    required this.onDelete,
    this.onRetrieve,
    this.enableSwipeToRetrieve = true,
  });

  @override
  State<BuildListOfDecks> createState() => BuildListOfDecksState();
}

class BuildListOfDecksState extends State<BuildListOfDecks> {
  @override
  Widget build(BuildContext context) {
    return SwipeToDeleteAndRetrieve(
      onDelete: widget.onDelete,
      onRetrieve: widget.enableSwipeToRetrieve ? widget.onRetrieve : null,
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
                      padding: const EdgeInsets.only(top: 7.0),
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

///
///
///ShowConfirmationDialog is a method for Confirm Dialog
class ShowConfirmationDialog extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ShowConfirmationDialog({
    super.key,
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

//Used to show the Dialog Box
void showConfirmationDialog(BuildContext context, String title, String text,
    VoidCallback onConfirm, VoidCallback onCancel) {
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

/// -------------------------- E N D ---------------------------
/// ---------------------- A C C O U N T -----------------------

///############################################################

///
///
/// ----------------------- S T A R T --------------------------
/// -------------------- S E T T I N G S -----------------------

// Container for a function in settings
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
    super.key,
  }) : assert(
  showSwitch == false ||
      (alternateIcon != null && alternateText != null),
  );

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
                  color: _isToggled
                      ? DeckColors.primaryColor
                      : DeckColors.primaryColor,
                  size: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    _isToggled
                        ? widget.alternateText!
                        : widget.nameOfTheContainer,
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
              const Icon(
                Icons.arrow_right,
                color: DeckColors.coverImageColorSettings,
                size: 32,
              ),
          ],
        ),
      ),
    );
  }
}

/// ------------------------- E N D ----------------------------
/// -------------------- S E T T I N G S -----------------------

///############################################################

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
  final bool isReadOnly;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  const BuildTextBox({
    Key? key,
    this.hintText,
    this.showPassword = false,
    this.leftIcon,
    this.rightIcon,
    this.initialValue,
    this.controller,
    this.onTap,
    this.isMultiLine = false,
    this.isReadOnly = false,
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
      readOnly: widget.isReadOnly,
      onTap: widget.onTap,
      controller: widget.controller,
      initialValue: widget.initialValue,
      style: GoogleFonts.nunito(
        color: Colors.white,
        fontSize: 16,
      ),
      maxLines: widget.isMultiLine ? null : 1,
      minLines: widget.isMultiLine ? 4 : 1,
      decoration:InputDecoration(
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

///
///
/// ----------------------- S T A R T --------------------------
/// --------------- E D I T  P R O F I L E ---------------------
//icon button
class BuildIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor, backgroundColor;

  const BuildIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor),
        onPressed: onPressed,
      ),
    );
  }
}
/// ------------------------- E N D ----------------------------
/// --------------- E D I T  P R O F I L E ---------------------

///############################################################


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
/// --------------- T A B  B A R ---------------------

///############################################################


///
///
/// ----------------------- S T A R T --------------------------
/// ------------ F L O A T I N G  B A R  A C T I O N ------------------

class DeckFAB extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;
  final VoidCallback onPressed;
  final double? fontSize;

  const DeckFAB({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    this.fontSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return
      Tooltip(
        //preferBelow: false,
        verticalOffset: -13,
        margin: const EdgeInsets.only(right: 65),
        message: text,
        textStyle: GoogleFonts.nunito(
            fontSize: fontSize ??  12, fontWeight: FontWeight.w900, color: DeckColors.white
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          //borderRadius: BorderRadius.circular(8.0),
        ),
        child:  FloatingActionButton(
          onPressed: () => onPressed(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
            ],
          ),
        ),
      );
  }
}

/// ------------------------- E N D ----------------------------
/// ---------------  D E C K  F L O A T I N G  B A R  A C T I O N  ---------------------


///############################################################

///
/// ----------------------- S T A R T --------------------------
/// ------------ D E C K  E M P T Y ------------------

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

/// ------------------------- E N D ----------------------------
/// ------------ D E C K  E M P T Y ------------------


///############################################################

///
/// ----------------------- S T A R T --------------------------
/// ------------ D E C K  T A S K T I L E ------------------
class DeckTaskTile extends StatefulWidget {
  final String title;
  final String deadline;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onDelete;
  final VoidCallback? onRetrieve, onTap;
  final bool enableRetrieve;

  const DeckTaskTile({
    Key? key,
    required this.title,
    required this.deadline,
    required this.isChecked,
    required this.onChanged,
    required this.onDelete,
    this.onRetrieve,
    this.enableRetrieve = false,
    this.onTap,
  }) : super(key: key);

  @override
  State<DeckTaskTile> createState() => DeckTaskTileState();
}

class DeckTaskTileState extends State<DeckTaskTile> {
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
    child:  SwipeToDeleteAndRetrieve(
      onRetrieve: widget.enableRetrieve ? widget.onRetrieve : null,
      enableRetrieve: widget.enableRetrieve,
      onDelete: widget.onDelete,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: DeckColors.gray,
        ),
        child: Row(
          children: [
            Checkbox(
              value: widget.isChecked,
              onChanged: widget.onChanged,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: DeckColors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        widget.deadline,
                        style: const TextStyle(
                          fontSize: 14,
                          color: DeckColors.white,
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


/// ------------------------- E N D ----------------------------
/// ------------ D E C K  T A S K T I L E ------------------


///############################################################


///
/// ----------------------- S T A R T --------------------------
/// ------------ D E C K  S L I V E R H E A D E R ------------------


class DeckSliverHeader extends StatelessWidget {
  final Color backgroundColor;
  final String headerTitle;
  final TextStyle textStyle;

  DeckSliverHeader({
    required this.backgroundColor,
    required this.headerTitle,
    required this.textStyle
  }
     );

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(

      pinned: true,
      floating: false,
      delegate: DeckDelegate(backgroundColor, headerTitle,textStyle),
    );
  }
}

class DeckDelegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final String headerTitle;
  final TextStyle textStyle;

  DeckDelegate(
    this.backgroundColor,
    this.headerTitle,
    this.textStyle
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          headerTitle,
          style: textStyle,
        ),
      ),
    );
  }


  @override
  double get maxExtent => 180;

  @override
  double get minExtent => 180;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}


///
///
///


