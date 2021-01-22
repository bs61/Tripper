import'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui';
import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:trip/useful/data.dart';
class Mapg extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Mapg> {
  List<Marker> allMarkers = [];
  GoogleMapController _controller;
  Location _location = Location();
  GoogleMapController mapController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(var i in getDestinationList()){
      for(var j in i.actlist){
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position:
        LatLng(j.position[0], j.position[1])));
  }}}
  @override
  Widget build(BuildContext context) {
    final LatLng center = new LatLng(35.6169411,10.9873365);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.teal,),
        body: Container(

          child: GoogleMap(
            onMapCreated: (controller) {
              mapController = controller;
            },
            markers: Set.from(allMarkers),
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: true,
            rotateGesturesEnabled: true,
            myLocationEnabled: true,
            compassEnabled: true,
            mapType: MapType.normal,
            zoomGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
              target: center,
              zoom: 6.0,
            ),
          ),
        ),
      ),
    );
  }
}
