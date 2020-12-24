
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationItem {

  IconData iconData;
  int index;

  NavigationItem(this.iconData,this.index);

}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem(Icons.home,0),
     NavigationItem(Icons.map_outlined,1),
    NavigationItem(Icons.favorite_sharp,2),
    // NavigationItem(Icons.person),
  ];
}

class Place {

  String description;
  String country;
  double price;
  List<String> images;
  bool favorite;
  String description2;

  Place(this.description, this.country, this.price, this.images, this.favorite,this.description2);

}

List<Place> getPlaceList(){
  return <Place>[
    Place(
        "a small island in south Tunisia with white sandy beaches and whitewashed domed houses.",
        "Djerba",
        3580.9,
        [
          "assets/images/Djerba/SightSeeing/tunisia-djerba-la-ghriba-synagogue-interior.jpg",
          "assets/images/Djerba/SightSeeing/tunisia-djerba-houmt-souk-old-town-market.jpg",
          "assets/images/Djerba/SightSeeing/tunisia-djerba-top-attractions-bordj-el-kebir.jpg",
          "assets/images/Djerba/SightSeeing/tunisia-djerba-zarzis-mosque-of-zarzis.jpg",
        ],
        false,
        " "
    ),
    Place(
        "Amphitheatre of El Jem is the second largest built by the romans after the original in Rome",
        "ElJam",
        2990,
        [
          "assets/images/ElJam/SightSeeing/tunisia-el-djem-amphitheatre.jpg",
          "assets/images/ElJam/SightSeeing/tunisia-el-djem-amphitheatre-arena-view.jpg",
          "assets/images/ElJam/SightSeeing/tunisia-el-djem-amphitheatre-facade.jpg",
          "assets/images/ElJam/SightSeeing/tunisia-el-djem-amphitheatre-panorama.jpg",
        ],
        false,
        ""
    ),
    Place(
        "Kairouan, one of the most celebrated cities of the Islamic world",
        "Kairouan",
        4870.5,
        [
          "assets/images/Kairouan/SightSeeing/tunisia-kairouan-aghlabid-basins.jpg",
          "assets/images/Kairouan/SightSeeing/tunisia-kairouan-mosque-of-the-barber.jpg",
          "assets/images/Kairouan/SightSeeing/tunisia-kairouan-top-attractions-great-mosque.jpg",
          "assets/images/Kairouan/SightSeeing/tunisia-kairouan-top-attractions-medina.jpg",
        ],
        false,
        ""
    ),
    Place(
        "Mahdia is a coastal resort on a personal scale home to some of the most famous beaches in Tunisia",
        "Mahdia",
        4120.5,
        [
          "assets/images/Mahdia/SightSeeing/tunisia-mahdia-black-gate-entry-house-to-medina.jpg",
          "assets/images/Mahdia/SightSeeing/tunisia-mahdia-bordj-el-kebir.jpg",
          "assets/images/Mahdia/SightSeeing/tunisia-mahdia-medina-street-scene.jpg",
          "assets/images/Mahdia/SightSeeing/tunisia-mahdia-top-attractions-great-mosque.jpg",
          "assets/images/Mahdia/SightSeeing/tunisia-mahdia-top-attractions-old-harbor-area.jpg",
        ],
        false,
        ""
    ),
    Place(
        "Nabeul is famous for its pottery, its rush mats and its flower essences",
        "Nabeul",
        3990,
        [
          "assets/images/Nabeul/SightSeeing/118256632_351463602555376_2622677211289998929_n.jpg",
          "assets/images/Nabeul/SightSeeing/118371682_351463645888705_5148311259996981902_n.jpg",
          "assets/images/Nabeul/SightSeeing/118379152_351463852555351_2344629841885565297_n.jpg",
          "assets/images/Nabeul/SightSeeing/118394472_351463702555366_6166594799312235307_n.jpg",
        ],
        false,
        " "
    ),
    Place(
        "Sometimes called 'the Pearl of the Sahel', Sousse is prized for its excellent beaches.",
        "Sousse",
        4055,
        [
          "assets/images/Sousse/SightSeeing/tunisia-sousse-great-mosque.jpg",
          "assets/images/Sousse/SightSeeing/tunisia-sousse-kasbah.jpg",
          "assets/images/Sousse/SightSeeing/tunisia-sousse-medina-typical-medina-street-architecture.jpg",
          "assets/images/Sousse/SightSeeing/tunisia-sousse-souk-district.jpg",
        ],
        false,
        ""
    ),
    Place(
        "The Governorate of Zaghouan enjoys a privileged median location between northern, north western and central governorates",
        "Zaghouane",
        4055,
        [
          "assets/images/Zaghouane/122074867_1696670903844505_5961102045273062722_o.jpg",
          "assets/images/Zaghouane/122097396_1696670550511207_8238213662282877336_o.jpg",
          "assets/images/Zaghouane/122099922_1696670337177895_1256491939160524673_o.jpg",
          "assets/images/Zaghouane/122309225_1696671437177785_8790746345139450452_o.jpg",
        ],
        false,
        ""
    ),
    Place(
        "Zarzis, 540km south of Tunis, is famed for its mesmerising beaches, rich history and natural wealth.",
        "zarzis",
        4055,
        [
          "assets/images/Zarzis/118698785_1651638535014409_2187583044842240290_o.jpg",
          "assets/images/Zarzis/118744010_1651638411681088_3551943538371895691_o.jpg",
          "assets/images/Zarzis/118766666_1651639118347684_1930142356029671399_o.jpg",
          "assets/images/Zarzis/118785551_1651638851681044_8887713457698289081_o.jpg",
        ],
        false,
        ""
    ),
  ];
}

class Activity {

  String actname;
  String country;
  String iconUrl;
  Color iconColor;
  List<Acts> actlist;

  Activity(this.actname, this.country, this.iconUrl, this.iconColor,this.actlist);

}

List<Activity> getDestinationList(){
  return <Activity>[
    Activity(
      "Camping",
      "Forest",
      "assets/icons/camping.png",
      Color(0xFF18A2EF),
      getCampingList(),

    ),
    Activity(
      "Hiking",
      "Montain",
      "assets/icons/hiking.png",
      Color(0xFFFF5A5F),
      getHikingList(),
    ),
    Activity(
      "Visiting Museums",
      "Museum",
      "assets/icons/Museum.png",
      Color(0xFF2FC069),
      getMuseumList(),
    ),
    Activity(
      "Jet Ski",
      "Beach",
      "assets/icons/jetski.png",
      Color(0xFFFF8412),
      getJetSkiList(),
    ),
    Activity(
      "Discovery",
      "landscape",
      "assets/icons/discovery.png",
      Color(0xffBFAE48),
        getDiscoveryList()
    ),
    Activity(
      "Sightseeing",
      "wherever",
      "assets/icons/sightseeing.png",
      Color(0xFF3A0842),
      getCampingList(),
    ),
    Activity(
      "Parachute",
      "wherever",
      "assets/icons/parachute.png",
      Color(0xFFD2AB99),
      getParachuteList(),
    ),
    Activity(
      "Scuba dive",
      "wherever",
      "assets/icons/dive.png",
      Color(0xFF6B0F1A),
      getScubaDiveList(),
    ),
  ];
}

class Featured {

  String year;
  String title;
  String imageUrl;

  Featured(this.year, this.title, this.imageUrl);

}

List<Featured> getFeaturedList(){
  return <Featured>[
    Featured(
      "Sousse",
      "",
      "assets/images/cities/Sousse/SightSeeing/tunisia-sousse-medina-typical-medina-street-architecture.jpg",
    ),
    Featured(
      "Monastir",
      "",
      "assets/images/cities/Mahdia/SightSeeing/tunisia-mahdia-bordj-el-kebir.jpg",
    ),
    Featured(
      "Djerba",
      "",
      "assets/images/cities/Djerba/SightSeeing/tunisia-djerba-la-ghriba-synagogue-interior.jpg",
    ),
  ];
}

class Acts {

  String city;
  String Location;
  List imageUrl;


  Acts(this.city,this.Location, this.imageUrl );

}
List<Acts> getCampingList(){
  return <Acts>[
    Acts(
      " Bizerte",
      "Cap serta",
      ["assets/images/activities/Camping/Cap_serta_bizerte/image1.jpg",
        "assets/images/activities/Camping/Cap_serta_bizerte/image2.jpg",
        "assets/images/activities/Camping/Cap_serta_bizerte/image3.jpg",
        "assets/images/activities/Camping/Cap_serta_bizerte/image4.jpg",
        "assets/images/activities/Camping/Cap_serta_bizerte/image5.jpg",
        "assets/images/activities/Camping/Cap_serta_bizerte/image6.jpg",],
    ),
    Acts(
      " Ain Drahem",
      "el Ghdir",
      ["assets/images/activities/Camping/nefza_beja/image1.jpg",
        "assets/images/activities/Camping/nefza_beja/image2.jpg",],
    ),
    Acts(
      " Beja",
      "nefza",
      ["assets/images/activities/Camping/el_Ghdir_Ain_Drahem/image1.jpg",
          "assets/images/activities/Camping/el_Ghdir_Ain_Drahem/image2.jpg",
          "assets/images/activities/Camping/el_Ghdir_Ain_Drahem/image3.jpg",
          "assets/images/activities/Camping/el_Ghdir_Ain_Drahem/image4.jpg"],
    ),
  ];
}

List<Acts> getDiscoveryList(){
  return <Acts>[
    Acts(
      " Beja",
      "Barrage Kaseb",
      ["assets/images/activities/Discovery/barrage_kaseb_beja/image1.jpg",
        "assets/images/activities/Discovery/barrage_kaseb_beja/image2.jpg",],
    ),
    Acts(
      " Tembaine",
      "Desert Douz",
      ["assets/images/activities/Discovery/desert/image1.png",
        "assets/images/activities/Discovery/desert/image2.png",],
    ),
    Acts(
      " Tunis",
      "Downtown",
      ["assets/images/activities/Discovery/Downtown_Tunis/image1.jpg",
        "assets/images/activities/Discovery/Downtown_Tunis/image2.jpg",
        "assets/images/activities/Discovery/Downtown_Tunis/image3.jpg",
        "assets/images/activities/Discovery/Downtown_Tunis/image4.jpg",
        "assets/images/activities/Discovery/Downtown_Tunis/image5.jpg",
        "assets/images/activities/Discovery/Downtown_Tunis/image6.jpg",
        "assets/images/activities/Discovery/Downtown_Tunis/image7.jpg",
        "assets/images/activities/Discovery/Downtown_Tunis/image8.jpg",
        "assets/images/activities/Discovery/Downtown_Tunis/image9.jpg"],
    ),
    Acts(
      " Tunis",
      "Medina",
      ["assets/images/activities/Discovery/Medina_Tunis/image1.jpg",
        "assets/images/activities/Discovery/Medina_Tunis/image2.jpg",
        "assets/images/activities/Discovery/Medina_Tunis/image3.jpg",
        "assets/images/activities/Discovery/Medina_Tunis/image4.jpg",
        "assets/images/activities/Discovery/Medina_Tunis/image5.jpg",
        "assets/images/activities/Discovery/Medina_Tunis/image6.jpg",
        "assets/images/activities/Discovery/Medina_Tunis/image7.jpg",
        "assets/images/activities/Discovery/Medina_Tunis/image8.jpg"],
    ),
    Acts(
      " Tozeur",
      "Oasis",
      [
        "assets/images/activities/Discovery/oasis/image2.jpg",
        "assets/images/activities/Discovery/oasis/image3.jpg",
        "assets/images/activities/Discovery/oasis/image4.jpg",
        "assets/images/activities/Discovery/oasis/image5.jpg"],
    ),
    Acts(
      " Kasserine",
      "Sbeitla",
      ["assets/images/activities/Discovery/sbeitla_kasserine/image1.jpg",
        "assets/images/activities/Discovery/sbeitla_kasserine/image2.jpg",
        "assets/images/activities/Discovery/sbeitla_kasserine/image3.jpg",
        "assets/images/activities/Discovery/sbeitla_kasserine/image4.jpg",
        "assets/images/activities/Discovery/sbeitla_kasserine/image5.jpg",
        "assets/images/activities/Discovery/sbeitla_kasserine/image6.jpg"],
    ),Acts(
      " Tunis",
      "Sidi Bou Said",
      ["assets/images/activities/Discovery/Sidi_Bou_Said/image1.jpg",
        "assets/images/activities/Discovery/Sidi_Bou_Said/image2.jpg",
        "assets/images/activities/Discovery/Sidi_Bou_Said/image3.jpg",
        "assets/images/activities/Discovery/Sidi_Bou_Said/image4.jpg",
        "assets/images/activities/Discovery/Sidi_Bou_Said/image5.jpg",
        "assets/images/activities/Discovery/Sidi_Bou_Said/image6.jpg"],
    ),
  ];
}
List<Acts> getHikingList(){
  return <Acts>[
    Acts(
      " Bizerte",
      "Cap farina",

      ["assets/images/activities/Hiking/Capwabna/image1.jpg",
        "assets/images/activities/Hiking/Capwabna/image2.jpg",
        "assets/images/activities/Hiking/Capwabna/image3.jpg"],
    ),
    Acts(
      " Ben Arous",
      "Jbal Rsas",
      ["assets/images/activities/Hiking/jbal_rsas_ben_arous/image1.jpg",
        "assets/images/activities/Hiking/jbal_rsas_ben_arous/image2.jpg",
        "assets/images/activities/Hiking/jbal_rsas_ben_arous/image3.jpg",
        "assets/images/activities/Hiking/jbal_rsas_ben_arous/image4.jpg",
        "assets/images/activities/Hiking/jbal_rsas_ben_arous/image5.jpg"],
    ),
  ];
}
List<Acts> getJetSkiList(){
  return <Acts>[
    Acts(
      " Djerba",
      "Jet Ski",
      ["assets/images/activities/Jet_ski/Djerba/image1.jpg"],
    ),
    Acts(
      " Hammamet",
      "Jet Ski",
      ["assets/images/activities/Jet_ski/hammamet/image1.jpeg"],
    ),
    Acts(
      " Sousse",
      "Jet Ski",
      ["assets/images/activities/Jet_ski/sousse/image1.jpg"],
    ),
  ];
}
List<Acts> getParachuteList(){
  return <Acts>[
    Acts(
      " Hammamet",
      "Parachute",
      ["assets/images/activities/Parachute/hammamet/image1.jpg",
        "assets/images/activities/Parachute/hammamet/image2.jpg"],
    ),
    Acts(
      " Mahdia",
      "Parachute",
      ["assets/images/activities/Parachute/Mahdia/image1.jpg"],
    ),
  ];
}
List<Acts> getScubaDiveList(){
  return <Acts>[
    Acts(
      " Djerba",
      "Scuba Dive",
      ["assets/images/activities/Scuba_dive/djerba/image1.jpg",
        "assets/images/activities/Scuba_dive/djerba/image2.jpg",
        "assets/images/activities/Scuba_dive/djerba/image3.jpg"],
    ),
    Acts(
      " Bizerte",
      "Galite Islands",
      ["assets/images/activities/Scuba_dive/galite_islands/image1.jpg",
        "assets/images/activities/Scuba_dive/galite_islands/image2.jpg",
        "assets/images/activities/Scuba_dive/galite_islands/image3.jpg",
        "assets/images/activities/Scuba_dive/galite_islands/image4.jpg"],
    ),
  ];
}
List<Acts> getMuseumList(){
  return <Acts>[
    Acts(
      " Mahdia",
      "Archaeological\n Museum of El-Djem",
      ["assets/images/activities/Visiting_museums/Archaeological_Museum_of_El-Djem/image1.jpg",
      "assets/images/activities/Visiting_museums/Archaeological_Museum_of_El-Djem/image2.jpg",
      "assets/images/activities/Visiting_museums/Archaeological_Museum_of_El-Djem/image3.jpg",
      "assets/images/activities/Visiting_museums/Archaeological_Museum_of_El-Djem/image4.jpg"],
    ),
    Acts(
      " Tunis",
      "Bardo Museum",
      ["assets/images/activities/Visiting_museums/bardo_museum/image1.jpg",
        "assets/images/activities/Visiting_museums/bardo_museum/image2.jpg"],
    ),
    Acts(
      " Djerba",
      "Lalla Hadria Museum",
      ["assets/images/activities/Visiting_museums/Lalla_Hadria_Museum_Djerba/image1.png",
        "assets/images/activities/Visiting_museums/Lalla_Hadria_Museum_Djerba/image2.png"],
    ),
    Acts(
      " Djerba",
      "Guellala Museum",
      ["assets/images/activities/Visiting_museums/Musee_de_Guellala_Djerba/image1.png",
        "assets/images/activities/Visiting_museums/Musee_de_Guellala_Djerba/image2.png",
        "assets/images/activities/Visiting_museums/Musee_de_Guellala_Djerba/image3.png"],
    ),
  ];
}