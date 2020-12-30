
import 'package:trip/screens/Home.dart';
import 'package:trip/screens/Favorites.dart';
import 'package:trip/screens/MyPlans.dart';
import 'package:trip/useful/data.dart';
import 'package:trip/useful/constant.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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


