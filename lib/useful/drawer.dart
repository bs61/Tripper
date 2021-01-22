import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip/useful//config.dart';
import 'package:trip/services/auth.dart';
import 'package:trip/screens/login.dart';
import 'package:trip/screens/AboutUs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff9EC1A3),
      padding: EdgeInsets.only(top: 50, bottom: 66, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Image(
                  image: AssetImage('assets/images/LOGO.png'),
                  fit: BoxFit.fill,
                ),
                foregroundColor: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tripper',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  // Text('Active Status',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          Column(
            children: drawerItems
                .map((element) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => element['route']),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              element['icon'],
                              color: Colors.black87,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(element['title'],
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20))
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
          Container(
            width: MediaQuery.of(context).size.width + 139,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutUs()));
                    setState(() {});
                  },
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutUs()));
                    setState(() {});
                  },
                  child: Text(
                    'About us',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 2,
                  height: 20,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    child: Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    onTap: () async {
                      await _auth.signOut();
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('email');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => loginPage()));
                      setState(() {});
                    }),
                GestureDetector(
                    onTap: () async {
                      await _auth.signOut();
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('email');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => loginPage()));
                      setState(() {});
                    },
                    child: Text(
                      'Log out',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
