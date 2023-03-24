import "package:flashcards/try.dart";
import "package:flutter/material.dart";

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(
                'assests/backgroundLanding.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "FLIP\nFACTS",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 90,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500),
              ),
              FrostedGlassBox(
                  theWidth: 250.0,
                  theHeight: 50.0,
                  theChild: Text(
                    "Login?",
                    style: TextStyle(fontSize: 20, color: Colors.white54),
                  ))
            ]),
          )
        ]),
      ),
    );
  }
}
