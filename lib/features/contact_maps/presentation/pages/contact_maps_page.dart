
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactMapsPage extends StatefulWidget {

  @override
  _ContactMapsPageState createState() => _ContactMapsPageState();
}

class _ContactMapsPageState extends State<ContactMapsPage> {

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _myLocation =
  CameraPosition(target: LatLng(0, 0),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _myLocation,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}