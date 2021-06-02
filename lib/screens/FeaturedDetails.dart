import 'dart:ui';
import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trip/Commons/PlansModel.dart';
import 'package:trip/screens/Allactivities.dart';
import 'ActivityDetails.dart';
import 'package:trip/Provider/PlansProvider.dart';
import 'package:provider/provider.dart';


import 'package:trip/useful/data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class FeaturedDetails extends StatefulWidget {
  Plan plan1;
  FeaturedDetails({ this.plan1});
  @override
  _PlanDetails createState() => _PlanDetails();
}
class _PlanDetails extends State<FeaturedDetails> {


  @override
  Widget build(BuildContext context) {
  bool isadded=Provider.of<Allplans>(context,).Planexist(widget.plan1);
    List<Acts> activs=widget.plan1.activs;
    Plan Myplan = widget.plan1;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
      ),
      body: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState){return
            activs.isEmpty
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, right: 20.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.add_circle_outline_rounded,
                        size: 50.0,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        // _showMyDialog2(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>MyListView() ),
                        );

                      },
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Add Activities',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
              ],
            )
                : PageView.builder(
              controller: PageController(
                initialPage: 0,
                keepPage: true,
              ),
              itemCount: activs.length,
              itemBuilder: (context, index) {
                return Pagetemp(
                  activity: activs[index],
                  plan2: Myplan,
                  isadded: isadded,
                );
              },
              scrollDirection: Axis.vertical,
            );}
      ),
    );
  }


}

class Pagetemp extends StatefulWidget {
  Acts activity;
  Plan plan2;
  bool isadded;
  Pagetemp({this.activity, this.plan2,this.isadded});
  @override
  _PagetempState createState() => _PagetempState();
}

GoogleMapController mapController;

GoogleMapController _controller;
Location _location = Location();
void _onMapCreated(GoogleMapController _cntlr) {
  _controller = _cntlr;
  _location.onLocationChanged.listen((l) {
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(37.18, 10.26),
          zoom: 15,
        ),
      ),
    );
  });
}

List<Marker> allMarkers = [];

class _PagetempState extends State<Pagetemp> {
  Completer<GoogleMapController> _controller = Completer();
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
        LatLng(widget.activity.position[0], widget.activity.position[1])));
  }

  @override
  Widget build(BuildContext context) {
    double lo=widget.activity.position[0];
    double la=widget.activity.position[1];
    final LatLng center =   new LatLng(lo, la);
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          SizedBox(
            height: 23.0,
          ),
          Card(
              elevation: 2,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.5,
                      offset: Offset(0, 0),
                      spreadRadius: 1.5,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                      widget.activity.imageUrl[0],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              )),

          Container(
            width: double.infinity,
            // color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height - 274,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.5,
                  offset: Offset(0, 0),
                  spreadRadius: 1.5,
                ),
              ],
              borderRadius: BorderRadius.circular(60),
            ),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0)),
                  // side: BorderSide(width: 0.1, color: Colors.black)
                ),
                borderOnForeground: true,
                shadowColor: Colors.black26,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          widget.activity.location,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          Icons.place_outlined,
                          color: Colors.red,
                          size: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text(
                            widget.activity.city,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      thickness: 2.0,
                      height: 2.0,
                      color: Colors.blue,
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),

                    Container(
                      height: 248.0,
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
                          zoom: 15.0,
                        ),
                      ),
                    )
                  ],
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 5.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.46,
                child: RaisedButton(
                  onPressed: () {
                    if(!Provider.of<Allplans>(context,listen: false).Planexist(widget.plan2)){
                    Provider.of<Allplans>(context, listen: false).addPlan(widget.plan2);

                    setState(() {});}else{
                    }
                  },
                  child: Text(
                    Provider.of<Allplans>(context,listen: true).Planexist(widget.plan2)?'Added to Plans':'Add To My Plans',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(770)),
                    // side: BorderSide(width: 0.1, color: Colors.black)
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.46,
                child: RaisedButton(
                  child: Text(
                    'More Details',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ( context) =>
                              ActivityDetails(activity1: widget.activity)),
                    );},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(770)),
                    // side: BorderSide(width: 0.1, color: Colors.black)
                  ),
                ),
              ),
              SizedBox(width: 5.0)
            ],

          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //
          //     Container(
          //       width: MediaQuery.of(context).size.width * 0.46,
          //       child: RaisedButton(
          //         child: Text(
          //           'Add To My Plans',
          //           style: TextStyle(fontSize: 10.0),
          //         ),
          //         color: Colors.blue,
          //         onPressed: () {
          //           },
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(770)),
          //           // side: BorderSide(width: 0.1, color: Colors.black)
          //         ),
          //       ),
          //     ),
          //     SizedBox(width: 5.0)
          //   ],
          //
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.keyboard_arrow_down_sharp,
                size: 18.0,
              ),
              Center(child: Text('swipe up to see th next  activity')),
              Icon(
                Icons.keyboard_arrow_down_sharp,
                size: 18.0,
              ),
            ],
          ),
        ],
      ),
    );
  }


}
