import 'dart:convert';

import 'package:flashcards/connection/ipaddress.dart';
import 'package:flashcards/flashcard_view.dart';
import 'package:flashcards/widgets/custom_drawer.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

class Cards extends StatefulWidget {
  String category = "";
  Cards(this.category, {super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  int _currentIndex = 0;
  var carddata = [];
  fetchdata() async {
    print("personal");
    // );
    try {
      String url = "http://" +
          Ipaddress.ip +
          "/flashcards/fetchdata.php?category=" +
          widget.category;
      // this.cate!;
      print(url);
      Uri uri = Uri.parse(url);
      // var data = {'category': cate};
      var response = await http.get(uri);
      // arraylist???????????

      carddata = jsonDecode(response.body).toList();
      print("database");
      print(carddata);

      print(response.body);
      print(response.statusCode);
    } catch (e) {
      Fluttertoast.showToast(msg: "Error meesage");
      print(e);
      // break;
    }
    return carddata;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: FutureBuilder(
            future: fetchdata(),
            builder: (context, snapshot) {
              if (carddata != null) {
                // var length=0;
                return RefreshIndicator(
                  child: ListView.builder(
                    itemCount: carddata.length,
                    itemBuilder: (context, index) {
                      // if (index == 0) {
                      print(index);
                      if (index == 0) {
                        return Center(
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
                                      text: (carddata[_currentIndex]
                                          ['card_title']),
                                      id: carddata[_currentIndex]['card_id'],
                                      title: carddata[_currentIndex]
                                          ['card_title'],
                                      description: carddata[_currentIndex]
                                          ['card_description'],
                                    ),
                                    back: FlashcardView(
                                      text: (carddata[_currentIndex]
                                          ['card_description']),
                                      id: carddata[_currentIndex]['card_id'],
                                      title: carddata[_currentIndex]
                                          ['card_title'],
                                      description: carddata[_currentIndex]
                                          ['card_description'],
                                    ),
                                  )),
                              SizedBox(
                                height: 100,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _currentIndex = (_currentIndex - 1 >= 0)
                                            ? _currentIndex - 1
                                            : carddata.length - 1;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.chevron_left),
                                        Text('Prev',
                                            style: TextStyle(fontSize: 18))
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // _currentIndex += 1;
                                        _currentIndex = (_currentIndex + 1 <
                                                carddata.length)
                                            ? _currentIndex + 1
                                            : 0;
                                      });
                                    },
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
                        );
                      }
                    },
                    physics: const AlwaysScrollableScrollPhysics(),
                  ),
                  onRefresh: () {
                    return Future.delayed(Duration(seconds: (3).toInt()), () {
                      setState(() {});
                    });
                  },
                );
              } else {
                return const Text("Loading....");
              }
            }));
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < carddata.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : carddata.length - 1;
    });
  }
}
