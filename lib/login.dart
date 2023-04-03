import 'package:flutter/material.dart';
// import 'package:sendimage/createnews.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
                // height: 400,
                constraints: BoxConstraints.loose(Size.fromHeight(500.0)),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/LoginIn.png")))

                // child: Image.asset("assets/LoginIn.png")
                ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 300),
              // margin: EdgeI/nsets.only(top: 400),
              height: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Color.fromARGB(255, 228, 218, 254)),
              child: ListView(
                children: [
                  Center(
                    child: const Text("LOGIN",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 40,
                            color: Color.fromARGB(255, 79, 49, 162),
                            fontWeight: FontWeight.w700)),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
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
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            TextField(
                              controller: userNameController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 220, 207, 254),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                hintText: 'Enter your username',
                              ),
                            ),
                            SizedBox(height: 16.0),
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 220, 207, 254),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
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
                                              color: Color.fromARGB(
                                                  246, 255, 255, 255)))),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Center(
                                child: Text(
                              "Already have an account? Log in",
                              style: TextStyle(fontSize: 16),
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
