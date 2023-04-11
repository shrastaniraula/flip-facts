import 'package:flashcards/connection/ipaddress.dart';
import 'package:flashcards/connection/login_signup.dart';
import 'package:flashcards/widgets/textfield.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  validation(String name, String email, String password, String confirm) {
    if (name.isEmpty || email.isEmpty || password.isEmpty || confirm.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all the fields!");
      return;
    }
  
    if (password != confirm) {
      Fluttertoast.showToast(msg: "Password and confirm password must be same");
      return;
    }
  if (confirm.length <= 8) {
      Fluttertoast.showToast(
          msg: "Password should contain atleast 8 characters!");
      return;
    }
    //  String  emailvalidation(email);

    if (RegExp(r'@').hasMatch(email)) {
      LoginSingup obj = new LoginSingup();
      obj.signUp(name, email, password, context);
    } else {
      Fluttertoast.showToast(msg: "Please enter a valid email");
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    var fToast;

    void initState() async {
      // TODO: implement initState
      super.initState();
      fToast = FToast();
      fToast.init(context);
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 218, 254),
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Column(children: [
              const Text("SIGN UP",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 60,
                      color: Color.fromARGB(255, 79, 49, 162),
                      fontWeight: FontWeight.w700)),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    CustomTextField(
                        controller: nameController,
                        hintText: "Enter your name"),
                    SizedBox(height: 25.0),
                    Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    CustomTextField(
                        controller: emailController,
                        hintText: "Enter your email"),
                    SizedBox(height: 25.0),
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
                    SizedBox(height: 25.0),
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    CustomTextField(
                      controller: confirmPasswordController,
                      hintText: "Confirm your password",
                      hasAsterisks: true,
                    ),
                    SizedBox(height: 22.0),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Fluttertoast.showToast(msg: "Tapped");
                  // Perform signup logic here
                  String name = nameController.text.trim();
                  String email = emailController.text.trim();
                  String password = passwordController.text.trim();
                  String confirmPassword =
                      confirmPasswordController.text.trim();

                  validation(name, email, password, confirmPassword);

                  // print('Name: ${nameController.text}');
                  // print('Email: ${emailController.text}');
                  // print('Password: ${passwordController.text}');
                  // print('Confirm Password: ${confirmPasswordController.text}');
                  // obj.signUp(name, email, password, context);
                  // Navigator.pushReplacementNamed(context, '/login');
                },
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(255, 79, 49, 162),
                  ),
                  child: const Center(
                      child: Text('Sign Up',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(246, 255, 255, 255)))),
                ),
              ),
              SizedBox(height: 10.0),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text("Already have an account? Log in"))
            ]),
          ),
        ),
      ),
    );
  }
}
