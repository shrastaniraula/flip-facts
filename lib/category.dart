import 'package:flashcards/cards.dart';
import 'package:flashcards/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var category = [
    {'cat_name': 'Personal'},
    {'cat_name': 'Study'},
    {'cat_name': 'Miscellenious'},
  ];

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
        body: ListView.builder(
            itemCount: category.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Cards(category[index]['cat_name']!)));
                },
                child: Container(
                  height: 80,
                  width: 360,
                  margin: EdgeInsetsDirectional.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 228, 218, 254)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: Text(
                                category[index]['cat_name']!,
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              );
            })));
  }
}
