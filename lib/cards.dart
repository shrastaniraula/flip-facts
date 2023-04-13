// import 'dart:convert';

// import 'package:flashcards/connection/ipaddress.dart';
// import 'package:flashcards/widgets/custom_drawer.dart';
// import 'package:flashcards/flashcard.dart';
// import 'package:flashcards/flashcard_view.dart';
// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;

// class Cards extends StatefulWidget {
//   String? category;
//   @override
//   Cards(String category) {
//     this.category = category;
//   }
//   State<StatefulWidget> createState() => _CardsState(category);
// }

// class _CardsState extends State<Cards> {
//   String? cate;
//   _CardsState(String? category) {
//     this.cate = category;
//   }
// // Cards obj=new Cards(category)
//   // var carddata = [
//   //   {'card_title': "How are you?", 'card_description': "I am fine!"},
//   //   {'card_title': "Nepal?", 'card_description': "IIC!"},
//   //   {
//   //     'card_title': "What is the capital of Philipines?",
//   //     'card_description': "Malai yaad xaina"
//   //   },
//   //   {'card_title': "How are you?", 'card_description': "I am fine!"},
//   //   {'card_title': "K garne??", 'card_description': "Kaam"},
//   //   {'card_title': "How are you?", 'card_description': "I am fine!"},
//   //   {'card_title': "How are you?", 'card_description': "I am fine!"},
//   //   {'card_title': "How are you?", 'card_description': "I am fine!"},
//   //   {'card_title': "How are you?", 'card_description': "I am fine!"},
//   //   {'card_title': "How are you?", 'card_description': "I am fine!"},
//   //   {'card_title': "How are you?", 'card_description': "I am fine!"},
//   //   {
//   //     'card_title': "What is the full form of AI?",
//   //     'card_description': "Artificial Intelligence"
//   //   }
//   // ];

//   List<Flashcard> _flashcards = [
//     // Flashcard(
//     //     question: "What programming language does Flutter use?",
//     //     answer: "Dart"),
//     // Flashcard(question: "Who you gonna call?", answer: "Ghostbusters!"),
//     // Flashcard(
//     //     question: "Who teaches you how to write sexy code?",
//     //     answer: "Ya boi Kilo Loco!")
//   ];

//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     var carddata = [];
//     Future<List<dynamic>> fetchdata() async {
//       print("personal");
//       print(this.cate);
//       try {
//         String url = "http://" +
//             Ipaddress.ip +
//             "/flashcards/fetchdata.php?category=" +
//             this.cate!;
//         print(url);
//         Uri uri = Uri.parse(url);
//         // var data = {'category': cate};
//         var response = await http.get(uri);
//         // arraylist???????????

//         carddata = jsonDecode(response.body).toList();
//         print("database");
//         print(carddata);

//         print(response.body);
//         print(response.statusCode);
//       } catch (e) {
//         Fluttertoast.showToast(msg: "Error meesage");
//         print(e);
//         // break;
//       }
//       return carddata;
//     }

//     print(carddata);
//     print(this.cate);
//     // fetchdata(this.cate!);
//     for (int i = 0; i < carddata.length; i++) {
//       _flashcards.add(Flashcard(
//           question: carddata[i]['card_title']!,
//           answer: carddata[i]['card_description']!));
//       // _flashcards.add({question:carddata[i]['question']!,carddata[i]['answer']!})
//     }

//     print(_flashcards); //THIS??
//     print(fetchdata());
//     return MaterialApp(
//         home: Scaffold(
//       // appBar: Title(color: Colors.transparent, child: Row()),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Text(
//           "Welcome back",
//           style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//         ),
//       ),
//       drawer: CustomDrawer(),
//       body:
//           // FutureBuilder(
//           //     future: fetchdata(),
//           //     builder: (context, shapshot) {
//           //       print(carddata);
//           //       if (carddata != null) {
//           ListView.builder(
//               itemCount: 1,
//               itemBuilder: ((context, index) {
//                 return Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         height: 80,
//                       ),
//                       Container(
//                           height: 400,
//                           width: 370,
//                           child: FlipCard(
//                             front: Text("dsfsd"), //HERE? CARDATA?

//                             back: Text(carddata[index]['card_description']),
//                           )),
//                       SizedBox(
//                         height: 100,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           GestureDetector(
//                             onTap: showPreviousCard,
//                             child: Row(
//                               children: [
//                                 Icon(Icons.chevron_left),
//                                 Text('Prev', style: TextStyle(fontSize: 18))
//                               ],
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: showNextCard,
//                             child: Row(
//                               children: [
//                                 Text(
//                                   'Next',
//                                   style: TextStyle(fontSize: 18),
//                                 ),
//                                 Icon(Icons.chevron_right)
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       )
//                     ],
//                   ),
//                 );
//               })

//               // } else {
//               //   return Text("Loading");
//               // }
//               ),
//     ));
//   }

//   void showNextCard() {
//     setState(() {
//       _currentIndex =
//           (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
//     });
//   }

//   void showPreviousCard() {
//     setState(() {
//       _currentIndex =
//           (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
//     });
//   }
// }
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
                                            ['card_title'])),

// FlipCard(
//                             front: Text("dsfsd"), //HERE? CARDATA?

//                             back: Text(carddata[index]['card_description']),
//                           )
                                    back: FlashcardView(
                                        text: (carddata[_currentIndex]
                                            ['card_description'])),
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

                      // }
                      // int count = 0;
                      // String? heading = "";
                      // for (int i = 0;
                      //     i < data[index]['newsHeading'].length;
                      //     i++) {
                      //   while (count < 80) {
                      //     heading = heading! + data[index]['newsHeading'][i];
                      //   }
                      // }
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
