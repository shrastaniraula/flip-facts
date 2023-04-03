import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Category extends StatelessWidget {
  const Category({super.key});

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
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.pushReplacementNamed(context, '/');
          //         print("Icon Pressed");
          //       },
          //       icon: const Icon(Icons.logout))
          // ],
        ),
        drawer: Drawer(
          child: ListView(children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text('List Of Cards'),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.library_add),
              title: const Text('Add Cards'),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
          ]),
        ),
        
    );
  }
}