

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Provider/FavoritesProvider.dart';
import 'Provider/PlansProvider.dart';
import 'provider/modelHud.dart';
import 'package:provider/provider.dart';
import 'screens/splashscreen.dart';


  Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider<modelHud>(
          create: (context)=>modelHud(),
        ),
        ChangeNotifierProvider<Allfavorites>(
          create: (context)=>Allfavorites(),
        ),
        ChangeNotifierProvider<Allplans>(
          create: (context)=>Allplans(),
        ),
      ],
        child: MyApp()));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: SplashScreen()),
    );
  }
}




