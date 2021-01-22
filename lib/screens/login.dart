import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool obs = true;
  String email, password;
  final auth = Auth();

  String _errorMessage(String str) {
    switch (str) {
      case 'The password is invalid or the user does not have a password.':
        return "The password is invalid or the user does not have a password.";
      case 'Password should be at least 6 characters':
        return 'Password should be at least 6 characters';
      case 'The email address is badly formatted.':
        return 'The email address is badly formatted.';
      default:
        return 'Please Verify your connexion ';
    }
  }
  bool checkBoxValue = false;
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Form(
          key: globalKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 300.0,
                    child: Image(
                      image: AssetImage('assets/images/LOGO4.png'),
                      fit: BoxFit.contain,
                    )),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          expand = true;
                        });
                        return ' E-Mail is Empty';
                        // ignore: missing_return
                      }
                    },
                    onSaved: (value) {
                      email = value;
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
                      errorStyle: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),
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
                  height: expand ?0 :15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          expand = true;
                        });
                        return 'password is empty ';
                        // ignore: missing_return
                      }
                    },
                    onSaved: (value) {
                      password = value;
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
                      errorStyle: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Color(0xFF666666),
                        size: 20.0,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (obs)
                              obs = false;
                            else
                              obs = true;
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
                      hintText: "Password",
                    ),
                    obscureText: obs,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.values[1],
                  children: [
                    Text(
                      'Remember me',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        child: StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return new Checkbox(
                              checkColor: Colors.white,
                              value: checkBoxValue,
                              activeColor: Colors.blue,
                              onChanged: (bool newValue) {
                                setState(() {
                                  checkBoxValue = newValue;
                                });
                              });
                        }),
                      ),
                    ),
                  ],
                ),

                CupertinoButton(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(25.0),
                  child: Text('Login'),
                  onPressed: () {
                    validate(context);
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Don't have an account?",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    CupertinoButton(
                      child: Text("SIGN UP",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage()),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Made with ',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> validate(BuildContext context) async {
    if (globalKey.currentState.validate()) {
      globalKey.currentState.save();

      try {
        final result = await auth.signin(email.trim(), password);
        if(checkBoxValue==true){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', 'useremail@gmail.com');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Bottomnav()),
        );}else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Bottomnav()),
        );}
      } catch (e) {
        String m = e.message.toString();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          _errorMessage(m).toString(),
        )));
      }
    }
  }
}
