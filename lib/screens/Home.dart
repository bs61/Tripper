import 'dart:ui';

import 'package:trip/Commons/global.dart';
import 'package:trip/services/StoreAndLoad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trip/screens/activities.dart';
import 'package:trip/useful/constant.dart';
import 'package:trip/useful/data.dart';
import 'package:trip/useful/detail.dart';
import 'package:trip/Provider/FavoritesProvider.dart';
import 'package:provider/provider.dart';
import 'package:trip/useful/drawer.dart';
import 'PlanDetails.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<NavigationItem> navigationItems = getNavigationItemList();
  NavigationItem selectedItem;
  Store _store = Store();
  List<Place> places = getPlaceList();
  List<Place> places2 = [];
  List<Activity> activities = getDestinationList();
  List<Featured> featureds = getFeaturedList();
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
    });
  }
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomPadding: false,
      // appBar: AppBar(
      //   backgroundColor: !isDrawerOpen
      //       ?Colors.transparent
      //       :Color(0xff416d6d),
      //   elevation: 0,
      //   leading: isDrawerOpen
      //       ? IconButton(
      //           icon: Icon(Icons.arrow_back_ios,color: Colors.black87,),
      //           onPressed: () {
      //             setState(() {
      //               xOffset = 0;
      //               yOffset = 0;
      //               scaleFactor = 1;
      //               isDrawerOpen = false;
      //             });
      //           },
      //         )
      //       : IconButton(
      //           icon: Icon(Icons.menu,color: Colors.black87,),
      //           onPressed: () {
      //             setState(() {
      //               xOffset = 230;
      //               yOffset = 150;
      //               scaleFactor = 0.6;
      //               isDrawerOpen = true;
      //             });
      //           }),

        // Builder(
        //   builder: (context) => GestureDetector(
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 8.0),
        //       child: Container(
        //         margin: EdgeInsets.only(
        //           right: 5,
        //           top: 5,
        //         ),
        //         width: 50,
        //         child: CircleAvatar(
        //           backgroundImage: AssetImage('assets/images/LOGO.png'),
        //           foregroundColor: Colors.blue,
        //         ),
        //       ),
        //     ),
        //     onTap: () => Scaffold.of(context).openDrawer(),
        //   ),
        // ),
      //   titleSpacing: 70.0,
      //   title: Text(
      //     "Explore",
      //     style: TextStyle(
      //       fontSize: 28,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //   ),
      //   centerTitle: false,
      //   actions: <Widget>[],
      // ),

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
            child: StreamBuilder<QuerySnapshot>(
                stream: _store.loadPlaces(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('loading...'));
                  } else {
                    for (var doc in snapshot.data.docs) {
                      places2.add(Place(
                          doc.data()[kdescription],
                          doc.data()[kcity],
                          doc.data()[kprice],
                          doc.data()[kimages],
                          "",doc.data()[kposition]));
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height:95.0,
                          child:  Center(
                          child: Text(
                            "Explore",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),),
                        SizedBox(
                          height: 25.0,
                        ),

                        // Padding(
                        //   padding: EdgeInsets.only(
                        //     left: 10,
                        //     right: 10,
                        //     top: 15,
                        //   ),
                        //   child: TextField(
                        //     decoration: InputDecoration(
                        //       hintText: 'Search',
                        //       hintStyle: TextStyle(
                        //         fontSize: 16,
                        //         color: Colors.grey[400],
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(40),
                        //         borderSide: BorderSide(
                        //           width: 0,
                        //           style: BorderStyle.none,
                        //         ),
                        //       ),
                        //       filled: true,
                        //       fillColor: Colors.white,
                        //       contentPadding: EdgeInsets.symmetric(
                        //           vertical: 20, horizontal: 24),
                        //       suffixIcon: Padding(
                        //         padding:
                        //             EdgeInsets.only(right: 24.0, left: 8.0),
                        //         child: Icon(
                        //           Icons.search,
                        //           color: Colors.grey[400],
                        //           size: 26,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          child: Container(
                            height: 130,
                            padding: EdgeInsets.only(
                              top: 8,
                              left: 16,
                            ),
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: buildPlaces(places2),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          padding: EdgeInsets.only(
                            top: 8,
                            left: 16,
                          ),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: buildDestinations(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Text(
                            "Featured Plans",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                          child: PageView(
                            physics: BouncingScrollPhysics(),
                            children: buildFeatureds(),
                          ),
                        ),
                        SizedBox(
                          height: 70.0,
                        ),
                      ],
                    );
                  }
                }),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: 60,
      //   margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8,),
      //   decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(10),
      //         topRight: Radius.circular(10),
      //         bottomLeft: Radius.circular(30),
      //         bottomRight: Radius.circular(30),
      //       )
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: buildNavigationItems(),
      //   ),
      // ),
    );
  }

  List<Widget> buildPlaces(List<Place> places2) {
    List<Widget> list = [];
    for (var place in places2) {
      list.add(buildPlace(place));
    }
    return list;
  }

  Widget buildPlace(Place place) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detail(place: place)),
        );
      },
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Hero(
          tag: place.images[0],
          child: Container(
            width: 230,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(place.images[0]),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (Provider.of<Allfavorites>(context, listen: false)
                          .IsFav(place)) {
                        Provider.of<Allfavorites>(context, listen: false)
                            .deletefavorite(place);
                      } else {
                        Provider.of<Allfavorites>(context, listen: false)
                            .addfavorite(place);
                      }
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 12,
                      top: 12,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Provider.of<Allfavorites>(context).IsFav(place)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: kPrimaryColor,
                        size: 36,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12,
                    bottom: 12,
                    right: 12,
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // Text(
                        //   place.description,
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 13,
                        //     fontWeight: FontWeight.bold
                        //   ),
                        // ),

                        SizedBox(
                          height: 8,
                        ),

                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              place.city,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildDestinations() {
    List<Widget> list = [];
    for (var activity in activities) {
      list.add(buildDestination(activity));
    }
    return list;
  }

  Widget buildDestination(Activity activity) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Activities(
                      acticity1: activity,
                      herotag: activity.actname,
                    )),
          );
        },
        child: Hero(
          tag: activity.actname,
          child: Container(
            width: 140,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    activity.iconUrl,
                    height: 32,
                    fit: BoxFit.fitHeight,
                    color: activity.iconColor,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    activity.actname,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    activity.city,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildFeatureds() {
    List<Widget> list = [];
    for (var featured in featureds) {
      list.add(buildFeatured(featured));
    }
    return list;
  }

  Widget buildFeatured(Featured featured) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => PlanDetails(activs: [Acts('', '', [])])),
        // );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Card(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(featured.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    featured.city,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    featured.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildNavigationItems() {
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = item;
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
                color:
                    selectedItem == item ? kPrimaryColor : Colors.transparent,
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
