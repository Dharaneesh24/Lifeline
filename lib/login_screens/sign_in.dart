import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../dashboard.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  Map<String, Object> loginmap = {};
  getLoginDetails() async{
    FirebaseFirestore.instance.collection("donors").get().then((myMockData) {
      if(myMockData.docs.isNotEmpty){
        for(int i=0;i<myMockData.docs.length ; i++){
          print(myMockData.docs[i].data());
          loginmap[myMockData.docs[i].data()['email']]=myMockData.docs[i].data()["password"] ;
        }
      }
      print(loginmap);
    });
  }

  @override
  void initState() {
    super.initState();
    getLoginDetails();
  }

  @override
  Widget build(BuildContext context) {
    String email ="" ;
    String password="" ;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Expanded(
                flex: 16,
                child: Center(child: Container(child: Image.asset("assets/login_screens/Lifeline_logo.png"),),),
              ),
              Expanded(
                flex: 5,
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
                      email = value ;
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
                      password=value ;
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
                      "Forgot Password?",
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
                        "Click here",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
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
                flex: 3,
                child: SizedBox(),
              ),
              GestureDetector(
                onTap: (){
                  print(email) ;
                  print(password) ;
                  if(!loginmap.containsKey(email)){
                    print("not registered") ;
                    // you have not registered yet
                  }
                  else if(loginmap[email] != password){
                    print("wrong password") ;
                    // your password is wrong
                  }
                  else if(loginmap.containsKey(email) && loginmap[email] == password){
                    //Successfully logged in
                    print("logged in") ;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard(email: email,),),
                    );
                  }
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
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/login_screens/left_dash.png"),
                    Text(
                      "Or Continue with",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset("assets/login_screens/right_dash.png"),
                  ],
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
                          child: Image.asset("assets/login_screens/google_icon.png"),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffE72D3B).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(21),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          height: 67,
                          width: 69,
                          child: Center(
                            child: Image.asset("assets/login_screens/apple_icon.png"),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffE72D3B).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(21),
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
