import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip/screens/SignUpPage.dart';
import 'package:trip/services/auth.dart';
import 'package:trip/useful/bottomnavbar.dart';





class loginPage extends StatefulWidget {

  @override
  _login createState() => _login();
}

class _login extends State<loginPage> {
  double defaultFontSize = 14;
  double defaultIconSize = 17;
  final GlobalKey<FormState> globalKey=GlobalKey<FormState>();
  bool obs=true;
  String email,password;
  final auth=Auth();

  String _errorMessage(String str) {
    switch (str) {
      case 'The password is invalid or the user does not have a password.':
        return "mot de passe invalid ou l'utilisateur n'existe pas";
      case 'Password should be at least 6 characters':
        return 'le mot de passe doit au moins contenir 6 caractère';
      case 'The email address is badly formatted.':
        return 'Adresse mail non valide';
      default :
        return 'veuillez verifier votre connection ';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
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
        child: Center(
          child: Form(
            key: globalKey,
            child: ListView(
              children: [Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(height: 330.0,child: Image(image:AssetImage('assets/images/LOGO4.png'),fit:BoxFit.cover,)),
                  SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      // ignore: missing_return
                      validator:(value) {
                        if(value.isEmpty){
                          return ' E-Mail is Empty';
                          // ignore: missing_return
                        }
                      },
                      onSaved: (value){
                        email=value;
                      },
                      showCursor: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xFF666666),
                          size: defaultIconSize,
                        ),
                        fillColor: Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                            color: Color(0xFF666666),
                            fontWeight: FontWeight.bold,
                            fontSize: defaultFontSize),
                        hintText: "E-Mail",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      // ignore: missing_return
                      validator:(value) {
                        if(value.isEmpty){
                          return 'champs password est vide';
                          // ignore: missing_return
                        }
                      },
                      onSaved: (value){
                        password=value;
                      },
                      showCursor: true,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Color(0xFF666666),
                          size: 20.0,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              if(obs)
                                obs=false;
                              else
                                obs=true;
                            });
                          },
                          child: Icon(
                            Icons.remove_red_eye,
                            color: Color(0xFF666666),
                            size: defaultIconSize,
                          ),
                        ),
                        fillColor: Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.bold,
                          fontSize: defaultFontSize,
                        ),
                        hintText: "Mot de passe",
                      ),
                      obscureText: obs,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  CupertinoButton(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Text('Login'),
                    onPressed: (){validate(context);
                    },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Don't have an account?",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                      CupertinoButton(child: Text("SIGNUP",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>SignupPage() ),
                        );
                      },),
                    ],),
                  Padding(
                    padding: const EdgeInsets.only(top:40.0),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Text('Made with ',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                        Icon(Icons.favorite,color: Colors.red[700],),
                        Text('  By SltTeam',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
  Future<void> validate(BuildContext context) async {

    if(globalKey.currentState.validate()){
      globalKey.currentState.save();

        try{
          final result = await auth.signin(email.trim(), password);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>Bottomnav() ),
          );
        }catch(e){
          String m=e.message.toString();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(_errorMessage(m).toString(),
          )));
        }
    }
  }
}


