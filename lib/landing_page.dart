import "package:flashcards/try.dart";
import "package:flutter/material.dart";

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/backgroundLanding.png"))),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text("FLIP",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 90,
                              color: Color.fromARGB(246, 255, 255, 255),
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("FACTS",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 90,
                              color: Color.fromARGB(246, 255, 255, 255),
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 1,
              ),
              Column(
                children: [
                  FrostedGlassBox(
                      theWidth: 250.0,
                      theHeight: 50.0,
                      theChild: Text(
                        "Login?",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(246, 255, 255, 255)),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(246, 255, 255, 255),
                      ),
                      child: Center(
                          child: Text('Sign Up',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 79, 49, 162)))),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 1,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
