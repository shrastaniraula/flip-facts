import 'dart:convert';

import 'package:flashcards/connection/ipaddress.dart';
import 'package:flashcards/widgets/custom_drawer.dart';
import 'package:flashcards/flashcard.dart';
import 'package:flashcards/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Cards extends StatefulWidget {
  String? category;
  @override
  Cards(String category) {
    this.category = category;
  }
  State<StatefulWidget> createState() => _CardsState(category);
}

class _CardsState extends State<Cards> {
  int _currentIndex = 1;

  String? cate;
  _CardsState(String? category) {
    this.cate = category;
  }
  var carddata = [];
  fetchdata() async {
    // print("personal");
    // print(this.cate);
    try {
      String url = "http://" +
          Ipaddress.ip +
          "/flashcards/fetchdata.php?category=" +
          this.cate!;
      // print(url);
      Uri uri = Uri.parse(url);
      var response = await http.get(uri);

      carddata = jsonDecode(response.body).toList();
      // print(carddata);
      String frontData = carddata[_currentIndex]['card_title'];
      // print(frontData);
      // print(carddata);

      print(response.body);
      print(response.statusCode);
    } catch (e) {
      Fluttertoast.showToast(msg: "Error meesage");
      print(e);
    }
    return carddata;
  }

  List<Flashcard> _flashcards = [];
  List newdata = [];

  @override
  Widget build(BuildContext context) {
    print("this is data fetch");

    // newdata = fetchdata();
    // print(this.cate);
    // fetchdata(this.cate!);
    for (int i = 0; i < newdata.length; i++) {
      _flashcards.add(Flashcard(
          question: newdata[i]['card_title']!,
          answer: newdata[i]['card_description']!));
    }

    // print(_flashcards);
    // print(carddata);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Welcome back",
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        drawer: CustomDrawer(),
        body: ListView.builder(
            // future: fetchdata(),
            itemBuilder: (context, shapshot) {
          // print(carddata);
          if (carddata != null) {
            return ListView(
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
                                // text: carddata[_currentIndex]['card_title'],
                                text: "hello"),
                            back: FlashcardView(
                                // text: carddata[_currentIndex]
                                //     ['card_description'],
                                text: "hello")),
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
            );
          } else {
            return Text("Loading");
          }
        }),
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
