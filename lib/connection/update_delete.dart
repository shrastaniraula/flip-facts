import 'package:flashcards/category.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flashcards/connection/ipaddress.dart';
import 'package:flashcards/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateConn {
  var ip = Ipaddress.ip;

  update(String title, String description, var card_id, context) async {
    try {
      String serverUrl = "http://" + Ipaddress.ip + "/flashcards/update.php";
      Uri uri = Uri.parse(serverUrl);
      var data = {
        'title': title,
        'description': description,
        'card_id': card_id
      };
      var response = await http.post(uri, body: data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        //going to login page
        print("Successfully updated");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Category()));
        Fluttertoast.showToast(msg: "Successfully updated.");
      } else if (response.statusCode == 400) {
        Fluttertoast.showToast(msg: "Sorry, your account is not registered.");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Please check the network connection");
    }
  }

  delete(String title, String description, var card_id, context) async {
    try {
      String serverUrl = "http://" + Ipaddress.ip + "/flashcards/delete.php";
      Uri uri = Uri.parse(serverUrl);
      var data = {
        'title': title,
        'description': description,
        'card_id': card_id
      };
      var response = await http.post(uri, body: data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        //going to login page
        print("Successfully deleted");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Category()));
        Fluttertoast.showToast(msg: "Successfully deleted.");
      } else if (response.statusCode == 400) {
        Fluttertoast.showToast(msg: "Sorry, your account is not registered.");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Please check the network connection");
    }
  }
}
