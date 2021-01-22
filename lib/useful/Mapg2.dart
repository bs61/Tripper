import'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui';
import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:trip/useful/data.dart';
class Mapg2 extends StatefulWidget {
  List Positions;
  Mapg2({this.Positions});
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Mapg2> {
  List<Marker> allMarkers = [];
  GoogleMapController mapController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

        allMarkers.add(Marker(
            markerId: MarkerId('myMarker'),
            draggable: true,
            onTap: () {
              print('Marker Tapped');
            },
            position:
            LatLng(widget.Positions[0], widget.Positions[1])));
      }
  @override
  Widget build(BuildContext context) {
    final LatLng center = new LatLng(widget.Positions[0],widget.Positions[1]);

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
              zoom: 10.0,
            ),
          ),
        ),
      ),
    );
  }
}
