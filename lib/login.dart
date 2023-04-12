import 'package:flashcards/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:velocity_x/velocity_x.dart';

import 'connection/login_signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  validation(String username, String password) {
    // print("tapped");
    if (username.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all the fields!");
      return;
    }
    if (password.length <= 8) {
      Fluttertoast.showToast(
          msg: "Password should contain atleast 8 characters!");
    } else {
      LoginSingup obj = new LoginSingup();
      obj.login(username, password, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 207, 254),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VxArc(
                arcType: VxArcType.CONVEY,
                height: 45,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/LoginIn.png"))),
                  padding: EdgeInsets.all(230),
                )),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Username',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      CustomTextField(
                        controller: userNameController,
                        hintText: "Enter your password",
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      CustomTextField(
                        controller: passwordController,
                        hintText: "Enter your password",
                        hasAsterisks: true,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // Perform signup logic here
                            String username = userNameController.text.trim();
                            String password = passwordController.text.trim();

                            validation(username, password);
                          },
                          child: Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromARGB(255, 79, 49, 162),
                            ),
                            child: const Center(
                                child: Text('Log In',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(
                                            246, 255, 255, 255)))),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/signup');
                        },
                        child: Center(
                            child: Text(
                          "Dont have an account? Sign up",
                          style: TextStyle(fontSize: 16),
                        )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
