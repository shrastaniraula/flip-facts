import 'package:flashcards/category.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flashcards/flashcard.dart';
import 'package:flashcards/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../add_card.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Profile'),
          onTap: () {
            // Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.library_books),
          title: Text('List Of Cards'),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Category()));
          },
        ),
        ListTile(
          leading: Icon(Icons.library_add),
          title: Text('Add Cards'),
          onTap: () {
            // Navigator.pushReplacementNamed(context, '/addCards');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AddFlashcardPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('LogOut'),
          onTap: () {
            // Navigator.pop(context);
          },
        ),
      ]),
    );
  }
}
