import 'package:flashcards/Signup.dart';
import 'package:flashcards/cards.dart';
import 'package:flashcards/category.dart';
import 'package:flashcards/landing_page.dart';
import 'package:flashcards/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            fontFamily: GoogleFonts.poppins().fontFamily),
        home: Welcome(),
        // initialRoute: '/category',
        routes: {
          '/signup': (context) => Signup(),
          '/login': (context) => Login(),
          '/cards': (context) => Cards(),
          '/category': (context) => Category(),
          '/addCards': (context) => AddFlashcardPage(),
        });
  }
}
