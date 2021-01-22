import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment
                .bottomRight, // 10% of the width, so there are ten blinds.
            colors: [
              const Color(0xffF27121),
              const Color(0xffe94057),
              const Color(0xff8a2387),
            ], // red to yellowred to yellow
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.0),
            Container(
                height: 250.0,
                child: Image(
                  image: AssetImage('assets/images/LOGO4.png'),
                  fit: BoxFit.contain,
                )),
            Text(
                "we are 3 ICT engineering students at the higher school of communication of tunis SUP'COM. Although the application is a part of a school project it is brought to you through ambition hardwork and lots staying up at night.",
            textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic
              ),
            ),

            Stack(
              children: [

                Container(
                    height: MediaQuery.of(context).size.height*0.43,
                    child: Padding(
                      padding: const EdgeInsets.only(top:35.0),
                      child: Image(
                        image: AssetImage('assets/images/Layer_3.png'),
                        fit: BoxFit.contain,
                      ),
                    )
                ),
                Positioned(
                  top:62.0 ,
                  left: 85.0,
                  child:  Container(
                      height: 150.0,
                      width: 150.0,
                      child: Image(image:AssetImage('assets/images/salem.png'))),
                ),Positioned(
                  top:62.0 ,
                  left: 205.0,
                  child:  Container(
                      height: 150.0,
                      width: 150.0,
                      child: Image(image:AssetImage('assets/images/ayoub.png'),)),
                ),Positioned(
                  top:62.0 ,
                  left: 145.0,
                  child:  Container(
                      height: 150.0,
                      width: 150.0,
                      child: Image(image:AssetImage('assets/images/Ala.png'))),
                ),
                Positioned(
                  top:250.0 ,
                  left: MediaQuery.of(context).size.width*0.2,

                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.copyright,
                        color: Colors.black87,
                      ),
                      Text(
                        ' Made with ',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red[700],
                      ),
                      Text(
                        '  By SltTeam',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
