import 'package:trip/useful/data.dart';
import 'package:flutter/cupertino.dart';
class Allfavorites extends ChangeNotifier {
  List<Place> Favorites =[];
  addfavorite(Place place1,) {
    Favorites.add(place1);
    notifyListeners();
  }
  bool IsFav(Place j){
    return Favorites.contains(j);
    notifyListeners();
  }

  deletefavorite(Place place1,) {
    Favorites.remove(place1);
    notifyListeners();
  }
}