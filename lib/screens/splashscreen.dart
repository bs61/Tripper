import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trip/screens/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible=false;
  bool _visible1=false;
  @override
  void initState() {
    super.initState();
    goMainScreen();
    change1();
    change2();
    change4();
    change5();
  }

  // 5 seconds later -> onDoneControl
  Future<Timer> goMainScreen() async {
    return new Timer(Duration(milliseconds:6500 ), onDoneControl);
  }
  Future<Timer>change1()async{
    return new Timer(Duration(milliseconds: 700),  change0);
  }
  Future<Timer>change2()async{
    return new Timer(Duration(milliseconds: 5300),  change0);
  }
  change0()async{
    setState(() {
      _visible = !_visible;
    });
  }
  change3()async{
    setState(() {
      _visible1 = !_visible1;
    });
  }
  Future<Timer>change4()async{
    return new Timer(Duration(milliseconds: 1200),  change3);
  }
  Future<Timer>change5()async{
    return new Timer(Duration(milliseconds: 5400),  change3);
  }

  // route to MainScreen
  onDoneControl() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => loginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight, // 10% of the width, so there are ten blinds.
                colors: [

                  const Color(0xffF27121),
                  const Color(0xffe94057),
                  const Color(0xff8a2387),
                ], // red to yellowred to yellow
                tileMode: TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
            child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedOpacity(opacity: _visible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 1000),
                    child: Container(height:400.0,width:350.0,child: Image(image: AssetImage('assets/images/LOGO4.png'),fit: BoxFit.contain,))),
                AnimatedOpacity(
                  opacity: _visible1 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 1000),
                  child: Text("Welcome to Tripper",
                      style: new TextStyle(fontStyle:FontStyle.italic, fontSize: 40,color: Colors.white)),
                ),
              ],
            ),
        ],
      ),
          )),
    );
  }
}
