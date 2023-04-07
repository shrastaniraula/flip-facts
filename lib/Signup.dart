import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "package:flutter/material.dart";

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

  @override
  Widget build(BuildContext context) {
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
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your name',
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm your password',
                      ),
                    ),
                    SizedBox(height: 22.0),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Perform signup logic here
                  print('Name: ${nameController.text}');
                  print('Email: ${emailController.text}');
                  print('Password: ${passwordController.text}');
                  print('Confirm Password: ${confirmPasswordController.text}');
                  Navigator.pushReplacementNamed(context, '/login');
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
