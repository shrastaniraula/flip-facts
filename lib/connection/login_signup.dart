// import 'dart:html';
// import 'dart:js';
import 'package:flashcards/category.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flashcards/connection/ipaddress.dart';
import 'package:flashcards/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginSingup {
  var ip = Ipaddress.ip;

  login(String username, String password, context) async {
    try {
      String serverUrl = "http://" + Ipaddress.ip + "/flashcards/login.php";
      Uri uri = Uri.parse(serverUrl);
      var data = {'name': username, 'password': password};
      var response = await http.post(uri, body: data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        //going to login page
        print("going to category");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Category()));
      } else if (response.statusCode == 400) {
        Fluttertoast.showToast(msg: "Sorry, your account is not registered.");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Please check the network connection");
    }
  }

  signUp(
      String name, String email, String password, BuildContext context) async {
    print(name);
    print(email);
    print(password);
    try {
      String serverUrl = "http://" + Ipaddress.ip + "/flashcards/signup.php";
      print(serverUrl);
      Uri uri = Uri.parse(serverUrl);
      var data = {'name': name, 'email': email, 'password': password};
      print(data);
      var response = await http.post(uri, body: data);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        //going to login page
        print("going to login");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else if (response.statusCode == 400) {
        Fluttertoast.showToast(msg: "Username already taken.");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Please check the network connection");
    }
  }
}
// }
