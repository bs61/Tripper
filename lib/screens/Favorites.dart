import 'package:flutter/material.dart';
import 'package:trip/Provider/FavoritesProvider.dart';
import 'package:provider/provider.dart';
import 'package:trip/useful/data.dart';
import 'package:trip/useful/constant.dart';





class Favorite extends StatefulWidget {
  bool variable = false;
  Favorite({this.variable});
  @override
  _State createState() => _State();
}

class _State extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    List<Place> MyFavs=Provider.of<Allfavorites>(context,listen:false).Favorites;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading:  Padding(
      // padding: const EdgeInsets.only(left:8.0),
      // child: Container(
      //   margin: EdgeInsets.only(right: 5, top: 5,),
      //   width: 50,
      //
      //       child: CircleAvatar(
      //         backgroundImage: AssetImage('assets/images/LOGO.png'),
      //         foregroundColor: Colors.blue,
      //       ),
      //     ),
      //   ),
      //   title: Text(
      //     "My Favorites",
      //     style: TextStyle(
      //       fontSize: 28,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //   ),
      //   centerTitle: false,
      //   actions: <Widget>[
      //
      //   ],
      // ),
      body: Column(
        children: [
          Container(
            height:90.0,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget.variable
                    ?Padding(
                      padding: const EdgeInsets.only(right:70.0),
                      child: IconButton(icon: Icon(Icons.arrow_back,size: 30.0,),onPressed: (){Navigator.pop(context);},),
                    )
                    :Padding(
                      padding: const EdgeInsets.only(right:120.0),
                      child: SizedBox(),
                    ),
                Center(
                  child: Text(
                    "Favorites",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),),
          Expanded(
            child: ListView.builder(
              itemCount:MyFavs.length ,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: Card(
              elevation: 2,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
              ),
              child: Container(
                  height: 170.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(MyFavs[index].images[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.only(top:120.0),
                        child: Container(
                          color: Colors.black38.withOpacity(0.4),
                          height: 70.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                           Provider.of<Allfavorites>(context,listen:false).deletefavorite(MyFavs[index]);

                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 12, bottom: 12,),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                               Icons.favorite ,
                              color: kPrimaryColor,
                              size: 36,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12, bottom: 12, right: 12,),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              SizedBox(
                                height: 8,
                              ),

                              Row(
                                children: <Widget>[

                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 30,
                                  ),

                                  SizedBox(
                                    width: 8,
                                  ),

                                  Text(
                                    MyFavs[index].city,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
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
                );
              },
            ),
          ),
        ],
      ),
      
      
      
     /* ListView(
        children: [
          Container(
            child: ColorFiltered(
              colorFilter: ColorFilter.linearToSrgbGamma(),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10) ,
            shape:RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0)),

            child: Row(

              children: <Widget> [

                Container(
                    width:190,
                    height:120,
                    alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                          'assets/images/cities/Sousse/SightSeeing/tunisia-sousse-medina-typical-medina-street-architecture.jpg',fit: BoxFit.fill,),
                    ),

                ),
                Icon(
                  Icons.location_on,
                  color: Colors.grey[700],
                  size: 35,
                ),
            SizedBox(
              width: 8,
            ),

            Text("Sousse",style: TextStyle(
              color: Colors.grey[700],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),

            ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    heightFactor: 3,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.deepOrange[700],
                      size: 35,

                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),*/
    );
  }
}