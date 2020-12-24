



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip/screens/login.dart';
import 'package:trip/services/auth.dart';

class SignupPage extends StatefulWidget
{
  @override
  _SignupPage createState() => _SignupPage();
}
class _SignupPage  extends State<SignupPage > {
  double defaultFontSize = 14;
  double defaultIconSize = 17;
  final GlobalKey<FormState> globalKey=GlobalKey<FormState>();
  bool obs=true;
  String  _email,_password;
  final auth=Auth();
  String _errorMessage(String str) {
    switch (str) {
      case 'The email address is already in use by another account.':
        return 'Cette adresse mail est déja utilisé';
      case 'Password should be at least 6 characters':
        return 'le mot de passe doit au moins contenir 6 caractère';
      case 'The email address is badly formatted.':
        return 'Adresse mail non valide';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight, // 10% of the width, so there are ten blinds.
            colors: [

              const Color(0xffF27121),
              const Color(0xffe94057),
              const Color(0xff8a2387),
            ], // red to yellow
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

                  Container(child: Image(image:AssetImage('assets/images/LOGO4.png'),fit: BoxFit.contain,)),
                  SizedBox(
                    height: 15.0,
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
                        _email=value;
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
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      // ignore: missing_return
                      validator:(value) {
                        if(value.isEmpty){
                          return ' le champs username is Empty';
                          // ignore: missing_return
                        }
                      },
                      onSaved: (value){

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
                          Icons.account_box,
                          color: Color(0xFF666666),
                          size: defaultIconSize,
                        ),
                        fillColor: Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                            color: Color(0xFF666666),
                            fontWeight: FontWeight.bold,
                            fontSize: defaultFontSize),
                        hintText: "userame",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
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
                        _password=value;
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
                    height: 10.0,
                  ),

                  CupertinoButton(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Text('Sign-up'),
                    onPressed: ()async{

                      if(globalKey.currentState.validate()){
                        globalKey.currentState.save();

                        try{
                          final result = await auth.signup(_email.trim(), _password);

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>loginPage() ),
                          );
                        }catch(e){
                          String m=e.message.toString();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(_errorMessage(m).toString(),
                          )));
                        }

                      }


                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>loginPage() ),
                    );

                    },
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),

    );
  }
}
