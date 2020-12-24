import 'package:flutter/cupertino.dart';

class modelHud extends ChangeNotifier
{
  bool isLoading=false;
  changeisloading(bool value){
    isLoading =value;
    notifyListeners();
  }
}