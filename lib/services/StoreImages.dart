import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:trip/useful/data.dart';
import 'dart:io';


class StoreImage{
  var storage = FirebaseStorage.instance;


  storeplacesim(List<Place> places)async{
    Map<String, dynamic> links={};
    var ref ;
    for(var i in places){
      var l=[];
      for(var j in i.images){
        int k=0;
        k+=1;
        String img=j;
        String imageName = img
            .substring(img.lastIndexOf("/"), img.lastIndexOf("."))
            .replaceAll("/", "");

        final Directory systemTempDir = Directory.systemTemp;
        final byteData = await rootBundle.load(img);

        final file =
        File('${systemTempDir.path}/$imageName.jpeg');
        await file.writeAsBytes(byteData.buffer.asUint8List(
            byteData.offsetInBytes, byteData.lengthInBytes));
        TaskSnapshot snapshot = await storage
            .ref()
            .child("Places/").child('${i.city}/$imageName')
            .putFile(file)
            .whenComplete(() async {l.add( (await storage
            .ref()
            .child("Places/").child('${i.city}/$imageName').getDownloadURL()).toString());});
         // l.add(snapshot.ref.getDownloadURL());
         // ref =snapshot.ref.fullPath;
      }
      if(l.isEmpty){print('liste vide');}else{
        print(l.toString());
      links.putIfAbsent(i.city, () => l) ;
    }

  }
  return links ;
}
  storeactivitiesimg(List<Activity> activities)async {
    Map<String, Map<String, dynamic>> links = {};
    var ref;
    for (var i in activities) {
      Map<String, dynamic> links2 = {};
      for (var j in i.actlist) {
        var l = [];
        for (var h in j.imageUrl) {
          int k = 0;
          k += 1;
          String img = h;
          String imageName = img
              .substring(img.lastIndexOf("/"), img.lastIndexOf("."))
              .replaceAll("/", "");

          final Directory systemTempDir = Directory.systemTemp;
          final byteData = await rootBundle.load(img);

          final file =
          File('${systemTempDir.path}/$imageName.jpeg');
          await file.writeAsBytes(byteData.buffer.asUint8List(
              byteData.offsetInBytes, byteData.lengthInBytes));
          TaskSnapshot snapshot = await storage
              .ref()
              .child("Activities/").child('${i.actname}').child('${j.city}/$imageName')
              .putFile(file)
              .whenComplete(() async {
            l.add((await storage
                .ref()
                .child("Activities/").child('${i.actname}').child(
                '${j.city}/$imageName').getDownloadURL()).toString());
          });
          // l.add(snapshot.ref.getDownloadURL());
          // ref =snapshot.ref.fullPath;
        }
        if (l.isEmpty) {
          print('liste vide');
        } else {
          print(l.toString());
          links2.putIfAbsent(j.city, () => l);
        }}
        if (links2.isEmpty) {
          print('liste vide');
        } else {
          print(links2.toString());
          links.putIfAbsent(i.actname, () => links2);
        }

    }
    return links;
    }

  }
