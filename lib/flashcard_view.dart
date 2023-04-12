import 'package:flashcards/update_delete.dart';
import 'package:flutter/material.dart';

class FlashcardView extends StatelessWidget {
  final String? text;

  FlashcardView({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromARGB(255, 228, 218, 254)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SingleChildScrollView(
                child: Text(
                  text!,
                  style: TextStyle(fontSize: 21),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateDelete()));
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
