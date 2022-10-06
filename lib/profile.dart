import 'package:flutter/material.dart';
import 'package:sem5_blood_mgmt/login_screens/intro_screen.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEAEF),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                  flex: 20,
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                    color: Color(0xffE72D3B).withOpacity(0.4),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Your Profile",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset("assets/profile/profile_face.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "UserName",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Vicky",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  width: 105,
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xff171F1D),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 80,
                child: Container(
                  child: ListView(
                    children: [
                      ProfileCard(
                        title: "Blood Group",
                        subtitle: "B+ve",
                        icon: Icon(
                          Icons.water_drop_outlined,
                          size: 40,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 1,
                        thickness: 1,
                      ),
                      ProfileCard(
                        title: "Date of Birth",
                        subtitle: "28/03/1979",
                        icon: Icon(
                          Icons.calendar_month_outlined,
                          size: 40,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding:EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Contact Details",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ProfileCard(
                        title: "Email address",
                        subtitle: "vick@gmail.com",
                        icon: Icon(
                          Icons.email_outlined,
                          size: 40,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 1,
                        thickness: 1,
                      ),
                      ProfileCard(
                        title: "Phone Number",
                        subtitle: "+14987889999",
                        icon: Icon(
                          Icons.phone_outlined,
                          size: 40,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 1,
                        thickness: 1,
                      ),
                      ProfileCard(
                        title: "Residential Address",
                        subtitle: "123 Home Street,New York-12",
                        icon: Icon(
                          Icons.location_on_outlined,
                          size: 40,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding:EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Settings",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 30, top: 15, bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 90,
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications_none_outlined,
                              size: 40,
                              color: Colors.black.withOpacity(0.7),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: Text(
                                "Notifications",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        height: 1,
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IntroScreen()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 30, top: 15, bottom: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 90,
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout_outlined,
                                size: 40,
                                color: Colors.black.withOpacity(0.7),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  ProfileCard(
      {required this.title, required this.subtitle, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 15, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 90,
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 20,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
