import 'package:flashcards/widgets/textfield.dart';
import 'package:flutter/material.dart';

class AddFlashcardPage extends StatefulWidget {
  @override
  _AddFlashcardPageState createState() => _AddFlashcardPageState();
}

class _AddFlashcardPageState extends State<AddFlashcardPage> {
  String? gender;
  TextEditingController CardNameController = TextEditingController();
  TextEditingController CardDescController = TextEditingController();

  void _submitForm() {
    // TODO: Implement form submission logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/category');
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
                  controller: CardNameController,
                  hintText: "Enter your Card title",
                ),
                SizedBox(height: 16.0),
                Text(
                  'Card Description',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                CustomTextField(
                  controller: CardDescController,
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
                      title: Text("Male"),
                      value: "male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Female"),
                      value: "female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Other"),
                      value: "other",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    )
                  ],
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  child: Text('Add Card'),
                  onPressed: _submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
