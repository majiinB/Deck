import 'package:deck/pages/misc/colors.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deck/pages/misc/widget_method.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayMyDeckPage extends StatefulWidget {
  const PlayMyDeckPage({Key? key});

  @override
  _PlayMyDeckPageState createState() => _PlayMyDeckPageState();
}

class  _PlayMyDeckPageState extends State<PlayMyDeckPage> {
  PageController pageController = PageController();
  int currentIndex = 0;
  List<String> frontContents = [
    'Tanga tanga amp',
    'Loh putangina',
    'Tangina ng bumoto kay bbm',
  ];
  List<String> backContents = [
    'have a shared goal that everyone knows',
    'tanginamong hayup ka may pamilya na yung tao kumekerengkeng ka pa raffy tulfo meme',
    'A philosophical movement originating in the late 19th and early 20th centuries, characterized by an exploration of the individuals subjective experience and the fundamental nature of existence. At its core, existentialism grapples with profound questions regarding human freedom, choice, and responsibility in the face of a seemingly indifferent or absurd universe. Key figures such as Jean-Paul Sartre, Friedrich Nietzsche, and Martin Heidegger have contributed seminal works that delve into the complexities of existence, offering insights into the nature of authenticity, alienation, and the search for meaning in a world devoid of inherent purpose.'

  ];
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DeckBar(
          title: 'Play My Deck',
          color: DeckColors.white,
          fontSize: 24,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Text(
                'Deck ni Leila 101',
                 style: GoogleFonts.nunito(
                  color: DeckColors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: frontContents.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: FlipCard(
                      front: buildFlipCard(frontContents[index]),
                      back: buildFlipCard(backContents[index]),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0, top: 40.0, left: 25.0, right: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: DeckColors.accentColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          color: DeckColors.white,
                          onPressed: () {
                            if (currentIndex > 0) {
                              pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }
                          },
                        ),
                      Text(
                          '${currentIndex + 1} / ${frontContents.length}',
                          style: GoogleFonts.nunito(
                            color: DeckColors.primaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                      IconButton(
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                          color: Colors.white,
                          onPressed: () {
                            if (currentIndex < frontContents.length - 1) {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),
            ],
          ),
        ),
    );
  }
  Widget buildFlipCard(String content) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: DeckColors.accentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Theme(
          data: ThemeData(
              highlightColor: DeckColors.primaryColor,
          ),
          child: Scrollbar(
            controller: controller,
            thickness: 5.0,
            radius: const Radius.circular(10.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  content,
                  style: GoogleFonts.nunito(
                      color: DeckColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}