import 'package:flutter/material.dart';
import 'package:trip/useful/data.dart';
import 'package:trip/screens/activities.dart';


import 'package:flutter/services.dart'; //used for fullscreen

// void main() => runApp(AwesomeApp());
//
// class AwesomeApp extends StatefulWidget {
//   @override
//   _AwesomeAppState createState() => _AwesomeAppState();
// }
//
// class _AwesomeAppState extends State<AwesomeApp> {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setEnabledSystemUIOverlays([]); //hides navigation and status bar making app fullscreen
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyListView(),
//     );
//   }
// }

class MyListView extends StatelessWidget {
  List<List<Color>> colors = <List<Color>>[
    [
      Colors.redAccent,
      Colors.red[200],
    ],
    [
      Colors.pinkAccent,
      Colors.pink[200],
    ],
    [
      Colors.yellowAccent,
      Colors.yellow[200],
    ],
    [
      Colors.orangeAccent,
      Colors.orange[200],
    ],
    [
      Colors.purpleAccent,
      Colors.purple[200],
    ],
    [Colors.cyanAccent, Colors.cyan[200]]
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            // appBar: AppBar(),
            body: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 5.0),
                  child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(20.0) ,
                        gradient: LinearGradient(
                          colors: [Colors.orangeAccent, Colors.pinkAccent],
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 5, ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              onPressed: (){Navigator.pop(context);},
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                            ),

                          ],
                        ),
                      )),
                ),
                // Container(
                //   height: 50,
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       colors: [Colors.purpleAccent, Colors.purple],
                //     ),
                //   ),
                //   child: TabBar(
                //     tabs: <Widget>[
                //       Tab(
                //         child: Text("Designer"),
                //       ),
                //       Tab(
                //         child: Text("Category"),
                //       ),
                //       Tab(
                //         child: Text("Attention"),
                //       )
                //     ],
                //   ),
                // ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ListView.builder(
                          itemCount: getDestinationList().length, //total no of list items
                          itemBuilder: (BuildContext context, int currentitem) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Activities(
                                        acticity1: getDestinationList()[currentitem],
                                        herotag: getDestinationList()[currentitem].actname,
                                      )),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: getDestinationList()[currentitem].iconColor,
                                  // gradient: LinearGradient(
                                  //     colors:
                                  //     colors[currentitem % colors.length]),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    new BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 3.5,
                                        offset: new Offset(1.0, 2.0)),
                                  ],
                                ),
                                margin: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 150,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 100.0,
                                      width: 100.0,
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(left: 20,top: 40),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Image(image:AssetImage(getDestinationList()[currentitem].iconUrl,),color:getDestinationList()[currentitem].iconColor ,),
                                        radius: 30,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(top: 40,),
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 2,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(getDestinationList()[currentitem].actname,style: TextStyle(fontSize: 20),),
                                                    Text(getDestinationList()[currentitem].city)
                                                  ],
                                                ),
                                              )
                                          ),



                                        ],
                                      ),
                                    ),
                                    // Expanded(   //right half of listitem
                                    //   flex: 1,
                                    //   child: Container(
                                    //     child: Stack(
                                    //       children: [
                                    //         Padding(
                                    //           padding: const EdgeInsets.only(bottom:10.0,left: 5.0),
                                    //           child: IconButton(icon: Icon(Icons.place),iconSize: 40.0,onPressed: (){},),
                                    //         ),
                                    //         Padding(
                                    //           padding: const EdgeInsets.only(top:10.0),
                                    //           child: IconButton(icon: Icon(Icons.map_outlined),iconSize: 50.0,onPressed: (){},),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        color: Colors.green,
                      ),
                      Container(
                        color: Colors.red,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}