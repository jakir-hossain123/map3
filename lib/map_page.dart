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
    target: LatLng(23.76 , 90.38 ),
    zoom: 14
  );
  final List<Marker> myMarker = [];
  final List<Marker> markerList = [
    Marker(markerId: MarkerId('First'),
    position: LatLng(23.76 , 90.38 ),
      infoWindow: InfoWindow(title: 'I live in'),
    ),
    Marker(markerId: MarkerId('Second'),
      position: LatLng(23.86, 90.00),
      infoWindow: InfoWindow(title: 'MyHomeTown'),
    ),
    Marker(markerId: MarkerId('Third'),
      position: LatLng(23.8583 , 90.2667 ),
      infoWindow: InfoWindow(title: 'Savar'),
    ),

    //23.838047750820063, 89.78385693739705
    Marker(markerId: MarkerId('Fourth'),
      position: LatLng(23.8380, 89.7838 ),
      infoWindow: InfoWindow(title: 'Sibaloy'),
    ),

  ];
  void initState () {
    super.initState();
    myMarker.addAll(markerList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         GoogleMap(
            initialCameraPosition: _myLocation,
           mapType: MapType.normal,
           markers: Set<Marker>.of(myMarker),
           zoomControlsEnabled: false,
           onMapCreated: (GoogleMapController controller){
              _completer.complete(controller);
           },
        ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.location_searching),
        onPressed: ()async{
          GoogleMapController controller = await _completer.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
            const CameraPosition(
              target: LatLng(23.86, 90.00),
              zoom: 12
          ),
          ),
          );
          setState(() {

          });
      },
      ),
      );
  }
}
