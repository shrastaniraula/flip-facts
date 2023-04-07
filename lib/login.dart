import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
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
                  padding: EdgeInsets.all(200),
                )),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Username',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        controller: userNameController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 220, 207, 254),
                          // border: OutlineInputBorder(
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(30))),
                          hintText: 'Enter your username',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // SizedBox(height: 8.0),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 220, 207, 254),
                          // border: OutlineInputBorder(
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(30))),
                          hintText: 'Enter your password',
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // Perform signup logic here
                            print('UserName: ${userNameController.text}');
                            print('Password: ${passwordController.text}');
                            Navigator.pushReplacementNamed(
                                context, '/category');
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
