import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Image.asset("assets/dashboard/dashboard.png"),
        ),
      ),
    );
  }
}

