import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip/useful//config.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff9EC1A3),
      padding: EdgeInsets.only(top:50,bottom: 66,left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(child: Image(image:AssetImage('assets/images/LOGO.png'),fit: BoxFit.fill,),foregroundColor: Colors.blue,),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tripper',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  // Text('Active Status',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),

          Column(
            children: drawerItems.map((element) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){ Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => element['route']),
                );},
                child: Row(
                  children: [
                    Icon(element['icon'],color: Colors.black87,size: 30,),
                    SizedBox(width: 10,),
                    Text(element['title'],style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20))
                  ],

                ),
              ),
            )).toList(),
          ),

          Container(
            width: MediaQuery.of(context).size.width+139,
            child: Row(
              children: [
                Icon(Icons.info_outline,color: Colors.black,),
                SizedBox(width: 10,),
                Text('About us',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                Container(width: 2,height: 20,color: Colors.black,),
                SizedBox(width: 10,),
                Icon(Icons.logout,color: Colors.black,),
                Text('Log out',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
              ],
            ),
          )
        ],
      ),

    );
  }
}