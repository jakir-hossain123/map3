import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapPage extends StatefulWidget {
  const MapPage({super.key});



  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
 final Completer<GoogleMapController> _completer = Completer();
  static const  CameraPosition _myLocation = CameraPosition(
    target: LatLng(51.5072, -0.1275),
    zoom: 14// <--- Use the standard hyphen-minus (Unicode U+002D)zoom: 14
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         GoogleMap(
            initialCameraPosition: _myLocation,
           zoomControlsEnabled: false,
           onMapCreated: (GoogleMapController controller){
              _completer.complete(controller);
           },
        ),
      );
  }
}
