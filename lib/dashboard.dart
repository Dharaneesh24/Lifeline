import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sem5_blood_mgmt/googleMapScreen.dart';
import 'package:sem5_blood_mgmt/profile.dart';
import 'constants.dart';

class Dashboard extends StatefulWidget {

  final String email ;
  Dashboard({required this.email}) ;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin{
  String email = "" ;
  String name = "" ;
  Position? _currentPosition=null;
  bool gotLoc =false ;
  bool gotDet = false;
  var userData ;
  var userId;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        this._currentPosition = position;
        gotLoc =true ;
      });
      print(_currentPosition);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _LoadPosition() async {
    FirebaseFirestore.instance.collection("donors").get().then((myMockData) {
      if(myMockData.docs.isNotEmpty){
        for(int i=0;i<myMockData.docs.length ; i++){
          //initMarker(myMockData.docs[i].data(), myMockData.docs[i].id);
          //print(myMockData.docs[i].data());
          if(myMockData.docs[i].data()['email'] == email){
            gotDet = true;
            this.userData=myMockData.docs[i].data();
            this.userId = myMockData.docs[i].id ;
            print(this.userId) ;
            print(this.userData);
            print(userData["name"]);
            print(userData["blood_grp"]);
          }
        }
      }
    });
  }

  Future<void> _updatePosition() async {
    if(this._currentPosition!.latitude != null && this._currentPosition!.longitude!=null){
      FirebaseFirestore.instance.collection('donors').doc(userId).update(
          {
            "latitude": "${this._currentPosition!.latitude}",
            "longitude": "${this._currentPosition!.longitude}",
          }
      );
      print("updation done");
    }
  }

  @override
  void initState() {
    super.initState() ;
    email= widget.email ;
    _getCurrentPosition();
    _LoadPosition() ;
  }

  @override
  Widget build(BuildContext context) {
    String email = widget.email ;


    if(gotLoc==true && gotDet==true){
      print(_currentPosition);
      _updatePosition() ;
      return Scaffold(
        backgroundColor: Color(0xFFEEEAEF),
        body:SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProfileScreen(email: email,)),
                            );
                          },
                          child:
                          Image.asset("assets/dashboard/dashboard_img.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Hi, ${userData["name"]}!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 87,
                      height: 24,
                      child: Center(
                        child: Text(
                          'Emergency',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffFF0B0B),
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  child: TextField(
                    onChanged: (value) {},
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Search Nearby Blood Banks'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.maxFinite,
                  height: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/dashboard/loc_small.png"),
                              Text(
                                "Your Last Donation",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "02-SEP-2022",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.4),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Divider(
                        color: Colors.black,
                        height: 1,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "PSG Hospital Blood Bank",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "Blood donation Centre. Coimbatore, Tamil Nadu",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.black,
                  height: 1,
                  thickness: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Blood Bank nearby",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 85,
                  width: double.maxFinite,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      BBNearby(
                        hospital: "KMCH",
                        city: "Coimbatore",
                        image: Image.asset("assets/dashboard/kmch_img.png"),
                      ),
                      BBNearby(
                        hospital: "SHEELA",
                        city: "Coimbatore",
                        image: Image.asset("assets/dashboard/sheela_img.png"),
                      ),
                      BBNearby(
                        hospital: "PSG",
                        city: "Coimbatore",
                        image: Image.asset("assets/dashboard/kmch_img.png"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "History of donations",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Image.asset("assets/dashboard/history_don.png"),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/dashboard/next_don.png"),
                            Text(
                              "Next Donation\n  24/12/2022",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/dashboard/blood.png"),
                            Text(
                              "Blood Type\n       ${userData["blood_grp"]}",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GoogleMapScreen()),
                          );

                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/dashboard/location.png"),
                              Text(
                                "Location",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
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


class BBNearby extends StatelessWidget {
  final String hospital;
  final String city;
  final Image image;

  BBNearby({required this.hospital, required this.city, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 85,
      width: 150,
      child: Row(
        children: [
          SizedBox(
            width: 4,
          ),
          image,
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                hospital,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              Text(
                city,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  HistoryCard({required this.title, required this.subtitle});
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
