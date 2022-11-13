import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> with TickerProviderStateMixin{
  GoogleMapController? _googleMapController;
  Set<Marker> _markers = {};
  Position? _currentPosition=null;
  void initMarker(specify,specifyId) async{
    final Marker marker = Marker(
      markerId: MarkerId(specifyId),
      position: LatLng(
          specify['latitude'],specify['longitude']
      ),
      infoWindow: InfoWindow(
          title: specify['title'],
          snippet: specify['snippet']
      ),
      icon: (specify['color']=="orange")
          ?BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
          :(specify['color']=="blue")
          ?BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)
          :BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    setState(() {
      _markers.add(marker);
    });
  }

  getMarkerData() async{
    FirebaseFirestore.instance.collection("bb_hospitals_markers").get().then((myMockData) {
      if(myMockData.docs.isNotEmpty){
        for(int i=0;i<myMockData.docs.length ; i++){
          initMarker(myMockData.docs[i].data(), myMockData.docs[i].id);
        }
      }
    });
  }

  void onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("id-1"),
          position: LatLng(
              this._currentPosition!.latitude,this._currentPosition!.longitude
          ),
          infoWindow: InfoWindow(
            title: "Current Location",
            snippet: ""
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ),
      );
    });
  }

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
      setState(() => this._currentPosition = position);

    }).catchError((e) {
      debugPrint(e);
    });
  }




  @override
  void initState(){
    super.initState();
    _getCurrentPosition() ;
    getMarkerData();
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Color(0xffE72D3B).withOpacity(0.3),
        title: Text("Locate Blood Banks/Hospitals"),
      ),
      body: _currentPosition!=null?
      GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        scrollGesturesEnabled: true,
        onMapCreated: onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(
              this._currentPosition!.latitude,this._currentPosition!.longitude
          ),
          zoom: 15,
        ),
      )
      :
      Container(
        color: Color(0xFFF5F5F5),
        child: Center(
          child: SpinKitWave(
            color: Color(0xffE72D3B).withOpacity(0.8),
            size: 40.0,
            controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1000)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: (){
          _googleMapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(
                this._currentPosition!.latitude,this._currentPosition!.longitude
            ),
            zoom: 18,
          )));
          },
        child: Icon(Icons.gps_fixed),
          ),
    );
  }
}
