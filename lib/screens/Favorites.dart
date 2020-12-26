import 'package:flutter/material.dart';



class Favorite extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            color: Colors.blue,
            child: Container(
              height: 100.0,
              width: 100.0,
            ),

          ),
          Card(
            color: Colors.yellowAccent,
            child: Container(
              height: 100.0,
              width: 100.0,
            ),

          )
          // Text('Slt Sa7bi',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
        ],
      )),
    );
  }
}
