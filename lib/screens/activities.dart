import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip/screens/ActivityDetails.dart';
import 'package:trip/useful/data.dart';
import 'dart:ui';

class Activities extends StatefulWidget {
  Activity acticity1;
  String herotag;
  Activities({@required this.acticity1,@required this.herotag});
  @override
  _activities createState() => _activities();
}

class _activities extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: Text(
          widget.acticity1.actname,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },

          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),

      ),
      body:Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(image:AssetImage(widget.acticity1.actlist[0].imageUrl[0]),fit: BoxFit.cover,),

          Center(
            child: ClipRect(  // <-- clips to the 200x200 [Container] below
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15.0,
                  sigmaY: 15.0,
                ),
                child: Container(

                  alignment: Alignment.center,
                  child: Text('  '),
                ),
              ),
            ),
          ),
          Container(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
    itemCount: widget.acticity1.actlist.length,
    itemBuilder: (context, index) {
            return ActRow(activity2:widget.acticity1,indice: index);
    }



            ),
          ),
        ],
      ),
    );
  }
}


class ActRow extends StatelessWidget {
  Activity activity2;
  int indice ;
  ActRow({@required this.activity2,@required this.indice});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ActivityDetails(activity1:activity2.actlist[indice])),
        );
      },
      child: new Container(
          height: 160.0,


          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 10.0,
          ),
          child: new Stack(
            children: <Widget>[
              Container(
              height: 160.0,
              width: 285,
              margin: new EdgeInsets.only(left: 46.0),
              decoration: BoxDecoration(
                  color: Color(0xFFFAF7F0).withOpacity(0.4),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(0.0,20.0),
                    )
                  ]),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center ,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[

                      Text(activity2.actlist[indice].city,style: TextStyle(
                        fontSize: 20.0, fontStyle: FontStyle.italic,fontWeight: FontWeight.w400
                      ),),
                      Text(activity2.actlist[indice].location,style: TextStyle(
                          fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400

                      ),
                      textAlign: TextAlign.center,),

              ]),
                ),
              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  alignment: FractionalOffset.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(100.0)),
                  image:DecorationImage( image: AssetImage(activity2.actlist[indice].imageUrl[0]),
                    fit: BoxFit.cover,) ),
                 width: 100.0,
                  height: 100.0,

                ),
              ),
            ],
          )),
    );
  }
}


