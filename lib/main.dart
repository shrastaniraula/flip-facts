import 'package:flashcards/Signup.dart';
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
        ),
        home: Welcome(),
        routes: {
          '/signup': (context) => Signup(),
          '/login': (context) => Login(),
          '/category': (context) => Category(),
          '/cards': (context) => Cards(),
          '/addCards': (context) => AddFlashcardPage(),
        });
  }
}
