import 'package:flashcards/category.dart';
import 'package:flashcards/connection/add_cardConn.dart';
import 'package:flashcards/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class UpdateDelete extends StatefulWidget {
  String id;
  String title;
  String description;

  UpdateDelete(this.id, this.title, this.description, {super.key});
  @override
  State<UpdateDelete> createState() => _UpdateDeleteState();
}
// State<UpdateDelete> createState()=>_UpdateDeleteState();

class _UpdateDeleteState extends State<UpdateDelete> {
  // var id = "";
  // var title = "";
  // var description = "";
  // _UpdateDeleteState(this.id, this.title, this.description);
// String? id=widget.id;
  String category = "";

  @override
  validation(String cardtitle, String carddescription) {
    String user = "1";
    if (cardtitle.isEmpty || carddescription.isEmpty || category.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill the all fields!");
      return;
    }
    Conn conObj = new Conn();
    conObj.submitForm(cardtitle, carddescription, category, user);
  }

  Widget build(BuildContext context) {
    TextEditingController cardNameController =
        TextEditingController(text: widget.title);
    TextEditingController cardDescController =
        TextEditingController(text: widget.description);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Category()));
          },
        ),
        title: Text(
          'Add Cards',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Card Title',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                CustomTextField(
                  controller: cardNameController,
                  hintText: "Enter your Card title",
                ),
                SizedBox(height: 16.0),
                Text(
                  'Card Description',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                CustomTextField(
                  controller: cardDescController,
                  hintText: "Enter your card description",
                ),
                SizedBox(height: 40.0),
                Text('Categories', style: TextStyle(fontSize: 20.0)),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    RadioListTile(
                      title: Text("Study"),
                      value: "Study",
                      groupValue: category,
                      onChanged: (value) {
                        setState(() {
                          category = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Miscellenious"),
                      value: "Miscellenious",
                      groupValue: category,
                      onChanged: (value) {
                        setState(() {
                          category = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Personal"),
                      value: "Personal",
                      groupValue: category,
                      onChanged: (value) {
                        setState(() {
                          category = value.toString();
                        });
                      },
                    )
                  ],
                ),
                SizedBox(height: 15.0),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Perform signup logic here
                      String cardtitle = cardNameController.text;
                      String carddescription = cardDescController.text;
                      validation(cardtitle, carddescription);
                    },
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 79, 49, 162),
                      ),
                      child: const Center(
                          child: Text('Update Card',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(246, 255, 255, 255)))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Perform signup logic here
                      String cardtitle = cardNameController.text;
                      String carddescription = cardDescController.text;
                      validation(cardtitle, carddescription);
                    },
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 79, 49, 162),
                      ),
                      child: const Center(
                          child: Text('Delete Card',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(246, 255, 255, 255)))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
