import 'package:flutter/cupertino.dart';
import 'package:trip/Commons/PlansModel.dart';
import 'package:trip/useful/data.dart';
class Allplans extends ChangeNotifier {
  List<Plan> Plans =[];
  String Ville="None";
  
  addville(String v){
    Ville=v;
    notifyListeners();
  }
  addactiv(Plan plan1,Acts activ1) {
    int i=Plans.indexOf(plan1);
    Plans[i].activs.add(activ1);
    notifyListeners();
  }
  bool Planexist(Plan plan1){
    return Plans.contains(plan1);
  }
  deleteactiv(Plan plan1,Acts activ1) {
    Plans[Plans.indexOf(plan1)].activs.remove(activ1);
    notifyListeners();
  }



  addPlan(Plan plan1,) {
    Plans.add(plan1);
    notifyListeners();
  }

  deletePlan(Plan plan1,) {
    Plans.remove(plan1);
    notifyListeners();
  }
}