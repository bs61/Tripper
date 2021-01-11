
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trip/screens/Favorites.dart';
import 'package:trip/screens/MyPlans.dart';

Color primaryGreen = Color(0xff416d6d);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'Cats', 'iconPath': 'images/cat.png'},
  {'name': 'Dogs', 'iconPath': 'images/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'images/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'images/parrot.png'},
  {'name': 'Horses', 'iconPath': 'images/horse.png'}
];

List<Map> drawerItems=[
  {
    'icon': Icons.directions_run_outlined,
    'title' : 'view activities'

  },
  {
    'icon': Icons.navigation,
    'title' : 'view map'
  },
  {
    'icon': FontAwesomeIcons.plus,
    'title' : 'Add Plan',
    'route':Plans(),
  },
  {
    'icon': Icons.favorite,
    'title' : 'view favorites',
    'route': Favorite(),
  },


  {
    'icon': FontAwesomeIcons.userAlt,
    'title' : 'Profile'
  },
];