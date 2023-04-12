import 'package:fluttertoast/fluttertoast.dart';
import 'package:flashcards/connection/ipaddress.dart';
import 'package:flashcards/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Conn {
  submitForm(String card_title, String carddescription, String category,
      String user_id) async {
    // TODO: Implement form submission logicHere
    String url = "http://" + Ipaddress.ip + "/flashcards/addcards.php";
    Uri uri = Uri.parse(url);
    var data = {
      'title': card_title,
      'description': carddescription,
      'category': category,
      'user_id': user_id
    };
    var response = await http.post(uri, body: data);
    print(response.body);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Successfully send items");
      return;
    }

    if (response.statusCode == 400) {
      Fluttertoast.showToast(msg: "Already added");
      return;
    }
    if (response.statusCode == 404) {
      Fluttertoast.showToast(msg: "Error 404");
      return;
    }
  }
}
