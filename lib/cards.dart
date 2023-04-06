import 'package:flashcards/custom_drawer.dart';
import 'package:flashcards/flashcard.dart';
import 'package:flashcards/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  List<Flashcard> _flashcards = [
    Flashcard(
        question: "What programming language does Flutter use?",
        answer: "Dart"),
    Flashcard(question: "Who you gonna call?", answer: "Ghostbusters!"),
    Flashcard(
        question: "Who teaches you how to write sexy code?",
        answer: "Ya boi Kilo Loco!")
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: Title(color: Colors.transparent, child: Row()),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Welcome back",
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.pushReplacementNamed(context, '/');
          //         print("Icon Pressed");
          //       },
          //       icon: const Icon(Icons.logout))
          // ],
        ),
        drawer: CustomDrawer(),
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    height: 400,
                    width: 370,
                    child: FlipCard(
                        front: FlashcardView(
                          text: _flashcards[_currentIndex].question,
                        ),
                        back: FlashcardView(
                          text: _flashcards[_currentIndex].answer,
                        )),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: showPreviousCard,
                        child: Row(
                          children: [
                            Icon(Icons.chevron_left),
                            Text('Prev', style: TextStyle(fontSize: 18))
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: showNextCard,
                        child: Row(
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(fontSize: 18),
                            ),
                            Icon(Icons.chevron_right)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
