import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sem5_blood_mgmt/googleMapScreen.dart';
import 'package:sem5_blood_mgmt/login_screens/sign_in.dart';
import 'package:sem5_blood_mgmt/main.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if(notification!= null && android!=null){
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            )
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }

  void showNotification() {
    setState(() {
      print("notification appeared");
    });
    flutterLocalNotificationsPlugin.show(
        0,
        "Testing notification",
        "How you doing ?",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Image.asset("assets/login_screens/Background.png",
                  fit: BoxFit.cover,
                ),
              ),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Image.asset("assets/login_screens/intro_illustration.png"),
                    Text(
                      "LIFELINE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35
                      ),
                    ),
                    Text(
                      """\nBe  the reason for someone’s heartbeat.\nSaving a life won’t cost you anything.\nGo ahead and donate blood.
                    """,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignInScreen()),
                              );
                            },
                            // onTap:(){
                              //showNotification();
                              // String? token = await FirebaseMessaging.instance.getToken();
                              // print(token);
                            // },
                            child: Container(
                              width: 100,
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffF4BCC1),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffF4BCC1),
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
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
