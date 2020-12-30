import 'package:flutter/cupertino.dart';
import 'package:trip/Commons/PlansModel.dart';
class Allplans extends ChangeNotifier {
  List<Plan> Plans =[];


  addPlan(Plan plan1,) {
    Plans.add(plan1);
    notifyListeners();
  }

  deletePlan(Plan plan1,) {
    Plans.remove(plan1);
    notifyListeners();
  }
}