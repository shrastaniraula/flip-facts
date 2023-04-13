import 'package:flashcards/newcards.dart';
import 'package:flashcards/signup.dart';
import 'package:flashcards/cards.dart';
import 'package:flashcards/category.dart';
import 'package:flashcards/landing_page.dart';
import 'package:flashcards/login.dart';
import 'package:flutter/material.dart';
import 'add_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          // fontFamily: GoogleFonts.poppins().fontFamily
        ),
        home: Welcome(),
        initialRoute: '/category',
        routes: {
          '/signup': (context) => Signup(),
          '/cards': (context) => Cards(""),
          '/login': (context) => Login(),
          '/category': (context) => Category(),
          '/addCards': (context) => AddFlashcardPage(),
          // '/ishantry': (context) => NewCards(),
        });
  }
}
