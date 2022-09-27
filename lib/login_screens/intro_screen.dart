import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              child: Image.asset("assets/login_screens/Background.png",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Image.asset("assets/login_screens/intro_illustration.png"),
                  Text("Donate"),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}

