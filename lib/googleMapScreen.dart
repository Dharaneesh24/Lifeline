import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Set<Marker> _markers = {};
  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("id-1"),
          position: LatLng(
              11.018669,
              77.0054935
          ),
          infoWindow: InfoWindow(
            title: "PSG Hospitals",
            snippet: "Private Hospital"
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Locate Blood Banks/Hospitals"),
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            11.018669,
            77.0054935
          ),
          zoom: 15,
        ),
      ),
    );
  }
}
