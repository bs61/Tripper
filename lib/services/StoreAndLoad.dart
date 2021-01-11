import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip/Commons/global.dart';
import 'package:trip/useful/data.dart';



class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  storePlaces(List<Place> places,Map<String,dynamic> links) async{
    for( var zebbi in places ){
      _firestore.collection(kplaces).doc().set({
        kcity:zebbi.city,
        kdescription:zebbi.description,
        kimages:links[zebbi.city],
        kprice:zebbi.price,
        kposition:zebbi.position
      });
    }
  }
  storeActivties(data,List<Acts> activs) {
    var documentRef = _firestore.collection(Kactivities).doc();
    documentRef.set(data);
    for(var i in activs ){
      documentRef.collection(Kactivitydetails).doc().set({
        kcity:i.city,
        kact:i.location
      });
    }
  }
  Stream<QuerySnapshot> loadPlaces() {
    return _firestore.collection(kplaces).snapshots();
  }
  storeFeatured() {

  }
  store() {
  }

}