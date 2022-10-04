import 'package:flutter/material.dart';

import '../constants.dart';
import '../dashboard.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: SizedBox(),
              ),
              Expanded(
                flex: 18,
                child: SizedBox(),
              ),
              Expanded(
                flex: 10,
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 35),
                  child: TextField(
                    onChanged: (value) {
                    },
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration:
                    kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email'),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 35),
                  child: TextField(
                    onChanged: (value) {
                    },
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration:
                    kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password'),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.42),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 11,
                child: SizedBox(),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard(),),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 35),
                  height: 67,
                  width: double.maxFinite,
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffE72D3B).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(21),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffE72D3B).withOpacity(0.5),
                        offset:
                        Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 115),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 67,
                        width: 69,
                        child: Center(
                          child: Image.asset("assets/login_screens/apple_icon.png"),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffE72D3B).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(21),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffE72D3B).withOpacity(0.5),
                              offset:
                              Offset(2, 2), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          height: 67,
                          width: 69,
                          child: Center(
                            child: Image.asset("assets/login_screens/google_icon.png"),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffE72D3B).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(21),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffE72D3B).withOpacity(0.5),
                                offset:
                                Offset(2, 2), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
