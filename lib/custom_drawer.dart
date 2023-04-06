import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flashcards/flashcard.dart';
import 'package:flashcards/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

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
            Navigator.pushReplacementNamed(context, '/category');
          },
        ),
        ListTile(
          leading: Icon(Icons.library_add),
          title: Text('Add Cards'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/addCards');
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
