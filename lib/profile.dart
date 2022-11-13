import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sem5_blood_mgmt/login_screens/intro_screen.dart';

class ProfileScreen extends StatefulWidget {

  final String email ;
  ProfileScreen({required this.email}) ;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin{

  String email = "" ;
  bool gotDet = false;
  var userData ;

  Future<void> _getUserData() async {
    FirebaseFirestore.instance.collection("donors").get().then((myMockData) {
      if(myMockData.docs.isNotEmpty){
        for(int i=0;i<myMockData.docs.length ; i++){
          //initMarker(myMockData.docs[i].data(), myMockData.docs[i].id);
          //print(myMockData.docs[i].data());
          if(myMockData.docs[i].data()['email'] == email){
            this.gotDet = true;
            this.userData=myMockData.docs[i].data();
            print(this.userData);
            print(userData["name"]);
            print(gotDet);
            setState(() {
              print(3);
            });
          }
        }
      }
    });
  }
  @override
  void initState() {
    super.initState();
    email=widget.email ;
    _getUserData();
  }


  @override
  Widget build(BuildContext context) {
    String email = widget.email ;

    if(gotDet==true){
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
                                    "Username",
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
                                    "${userData["name"]}",
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
                          subtitle: "${userData["blood_grp"]}ve",
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
                          subtitle: "${userData["dob"]}",
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
                          subtitle: "${userData["email"]}",
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
                          subtitle: "${userData["phone_no"]}",
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
                          subtitle: "${userData["address"]}",
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
    else{
      // return Container(child: Center(child: Text("Loading"),),);
      return Container(
        color: Color(0xFFF5F5F5),
        child: Center(
          child: SpinKitWave(
            color: Color(0xffE72D3B).withOpacity(0.8),
            size: 40.0,
            controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1000)),
          ),
        ),
      ) ;
    }


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
