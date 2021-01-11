
import 'dart:io';

import 'package:trip/useful//Drawer.dart';
import 'package:trip/Commons/global.dart';
import 'package:trip/screens/Home.dart';
import 'package:trip/screens/Favorites.dart';
import 'package:trip/screens/MyPlans.dart';
import 'package:trip/services/StoreAndLoad.dart';
import 'package:trip/services/StoreImages.dart';
import 'package:trip/useful/data.dart';
import 'package:trip/useful/constant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Bottomnav extends StatefulWidget {
  Bottomnav({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<Bottomnav> {
  List<NavigationItem> navigationItems = getNavigationItemList();
  NavigationItem selectedItem;
  void initState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List _widgetOptions =[
    Explore(),
    Plans(),
    Favorite(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
bool ind=false;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {

    var storage = FirebaseStorage.instance;
    Map<String, dynamic> ref={};
    Store _store =Store();
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          AnimatedContainer(
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor)
              ..rotateY(isDrawerOpen ? -0.5 : 0),
            duration: Duration(milliseconds: 250),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                  // backgroundColor: !isDrawerOpen
                  //     ?Colors.transparent
                  //     :Color(0xff416d6d),
                  elevation: 0,
                  leading: isDrawerOpen
                      ? IconButton(
                    icon: Icon(Icons.arrow_back_ios,color: Colors.black87,),
                    onPressed: () {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      });
                    },
                  )
                      : GestureDetector(
                      child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/LOGO.png'),
                                  foregroundColor: Colors.blue,
                                ),
                      onTap: () {
                        setState(() {
                          xOffset = 230;
                          yOffset = 150;
                          scaleFactor = 0.6;
                          isDrawerOpen = true;
                        });
                      }),),
              drawer:Drawer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(child: RaisedButton(
                      onPressed: ()async{
                        // ref=await StoreImage().storeactivitiesimg(getDestinationList());
                        // for(var i in getDestinationList()){
                        //   _store.storeActivties({
                        //     kact:i.actname,
                        //     kplace:i.city,
                        //     kiconUrl:i.iconUrl,
                        //   },i.actlist );
                        // }
                        ref =await StoreImage().storeplacesim(getPlaceList());
                        // String img="assets/images/cities/Djerba/SightSeeing/tunisia-djerba-la-ghriba-synagogue-interior.jpg";
                        // String imageName = img
                        //     .substring(img.lastIndexOf("/"), img.lastIndexOf("."))
                        //     .replaceAll("/", "");
                        //
                        // final Directory systemTempDir = Directory.systemTemp;
                        // final byteData = await rootBundle.load(img);
                        //
                        // final file =
                        // File('${systemTempDir.path}/$imageName.jpeg');
                        // await file.writeAsBytes(byteData.buffer.asUint8List(
                        //     byteData.offsetInBytes, byteData.lengthInBytes));
                        // TaskSnapshot snapshot = await storage
                        //     .ref()
                        //     .child("images123/$imageName")
                        //     .putFile(file)
                        //     .snapshot;
                      },
                      child: Text('upload images'),
                    ),),
                    Center(child: RaisedButton(
                      onPressed: (){
                        print(ref['Sousse']);
                        // var ref=storage.ref().child('Places/');
                        // print(ref.toString());
                      },
                      child: Text('get links'),
                    )),
                    Center(child: RaisedButton(
                      onPressed: (){

                        // var ref=storage.ref().child('Places/');
                        _store.storePlaces(getPlaceList(), ref);
                      },
                      child: Text('uploadplaces'),
                    )),
                  ],
                ),
              ),
              extendBodyBehindAppBar: true,
              body: Center(
               child: _widgetOptions.elementAt(selectedItem.index),
                    ),
              extendBody: true,
              bottomNavigationBar: Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8,),
                decoration: BoxDecoration(
                    color: Color(0xffD6DFEB),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: buildNavigationItems(),
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
  List<Widget> buildNavigationItems(){
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item){
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = item;
          ind=item.ind;
        });
      },
      child: Container(
        width: 50,
        child: Stack(
          children: <Widget>[

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 40,
                height: 3,
                color: selectedItem == item ? kPrimaryColor : Colors.transparent,
              ),
            ),

            Center(
              child: Icon(
                item.iconData,
                color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
                size: 28,
              ),
            )

          ],
        ),
      ),
    );
  }
}


