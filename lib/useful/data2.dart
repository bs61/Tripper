
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationItem {

  IconData iconData;
  int index;
  bool ind;

  NavigationItem(this.iconData,this.index,this.ind);

}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem(Icons.home,0,false),
     NavigationItem(Icons.map_outlined,1,false),
    NavigationItem(Icons.favorite_sharp,2,true),
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
          "assets/images/cities/Djerba/SightSeeing/tunisia-djerba-la-ghriba-synagogue-interior.jpg",
          "assets/images/cities/Djerba/SightSeeing/tunisia-djerba-houmt-souk-old-town-market.jpg",
          "assets/images/cities/Djerba/SightSeeing/tunisia-djerba-top-attractions-bordj-el-kebir.jpg",
          "assets/images/cities/Djerba/SightSeeing/tunisia-djerba-zarzis-mosque-of-zarzis.jpg",
        ],
        false,
        " "
    ),
    Place(
        "Amphitheatre of El Jem is the second largest built by the romans after the original in Rome",
        "ElJam",
        2990,
        [
          "assets/images/cities/ElJam/SightSeeing/tunisia-el-djem-amphitheatre.jpg",
          "assets/images/cities/ElJam/SightSeeing/tunisia-el-djem-amphitheatre-arena-view.jpg",
          "assets/images/cities/ElJam/SightSeeing/tunisia-el-djem-amphitheatre-facade.jpg",
          "assets/images/cities/ElJam/SightSeeing/tunisia-el-djem-amphitheatre-panorama.jpg",
        ],
        false,
        ""
    ),
    Place(
        "Kairouan, one of the most celebrated cities of the Islamic world",
        "Kairouan",
        4870.5,
        [
          "assets/images/cities/Kairouan/SightSeeing/tunisia-kairouan-aghlabid-basins.jpg",
          "assets/images/cities/Kairouan/SightSeeing/tunisia-kairouan-mosque-of-the-barber.jpg",
          "assets/images/cities/Kairouan/SightSeeing/tunisia-kairouan-top-attractions-great-mosque.jpg",
          "assets/images/cities/Kairouan/SightSeeing/tunisia-kairouan-top-attractions-medina.jpg",
        ],
        false,
        ""
    ),
    Place(
        "Mahdia is a coastal resort on a personal scale home to some of the most famous beaches in Tunisia",
        "Mahdia",
        4120.5,
        [
          "assets/images/cities/Mahdia/SightSeeing/tunisia-mahdia-black-gate-entry-house-to-medina.jpg",
          "assets/images/cities/Mahdia/SightSeeing/tunisia-mahdia-bordj-el-kebir.jpg",
          "assets/images/cities/Mahdia/SightSeeing/tunisia-mahdia-medina-street-scene.jpg",
          "assets/images/cities/Mahdia/SightSeeing/tunisia-mahdia-top-attractions-great-mosque.jpg",
          "assets/images/cities/Mahdia/SightSeeing/tunisia-mahdia-top-attractions-old-harbor-area.jpg",
        ],
        false,
        ""
    ),
    Place(
        "Nabeul is famous for its pottery, its rush mats and its flower essences",
        "Nabeul",
        3990,
        [
          "assets/images/cities/Nabeul/SightSeeing/118256632_351463602555376_2622677211289998929_n.jpg",
          "assets/images/cities/Nabeul/SightSeeing/118371682_351463645888705_5148311259996981902_n.jpg",
          "assets/images/cities/Nabeul/SightSeeing/118379152_351463852555351_2344629841885565297_n.jpg",
          "assets/images/cities/Nabeul/SightSeeing/118394472_351463702555366_6166594799312235307_n.jpg",
        ],
        false,
        " "
    ),
    Place(
        "Sometimes called 'the Pearl of the Sahel', Sousse is prized for its excellent beaches.",
        "Sousse",
        4055,
        [
          "assets/images/cities/Sousse/SightSeeing/tunisia-sousse-great-mosque.jpg",
          "assets/images/cities/Sousse/SightSeeing/tunisia-sousse-kasbah.jpg",
          "assets/images/cities/Sousse/SightSeeing/tunisia-sousse-medina-typical-medina-street-architecture.jpg",
          "assets/images/cities/Sousse/SightSeeing/tunisia-sousse-souk-district.jpg",
        ],
        false,
        ""
    ),
    Place(
        "The Governorate of Zaghouan enjoys a privileged median location between northern, north western and central governorates",
        "Zaghouane",
        4055,
        [
          "assets/images/cities/Zaghouane/122074867_1696670903844505_5961102045273062722_o.jpg",
          "assets/images/cities/Zaghouane/122097396_1696670550511207_8238213662282877336_o.jpg",
          "assets/images/cities/Zaghouane/122099922_1696670337177895_1256491939160524673_o.jpg",
          "assets/images/cities/Zaghouane/122309225_1696671437177785_8790746345139450452_o.jpg",
        ],
        false,
        ""
    ),
    Place(
        "Zarzis, 540km south of Tunis, is famed for its mesmerising beaches, rich history and natural wealth.",
        "zarzis",
        4055,
        [
          "assets/images/cities/Zarzis/118698785_1651638535014409_2187583044842240290_o.jpg",
          "assets/images/cities/Zarzis/118744010_1651638411681088_3551943538371895691_o.jpg",
          "assets/images/cities/Zarzis/118766666_1651639118347684_1930142356029671399_o.jpg",
          "assets/images/cities/Zarzis/118785551_1651638851681044_8887713457698289081_o.jpg",
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
  List<String> imageUrl;
  String description;
  String position;
  String price;


  Acts(this.city,this.Location, this.imageUrl, this.description, this.position, this.price );

}
List<Acts> getCampingList(){
  return <Acts>[
    Acts(
      " Ain Drahem",
      "el Ghdir",
      ["assets/images/activities/Camping/el_Ghdir_Ain_Drahem/image1.jpg",
        "assets/images/activities/Camping/el_Ghdir_Ain_Drahem/image2.jpg",
        "assets/images/activities/Camping/el_Ghdir_Ain_Drahem/image3.jpg",
        "assets/images/activities/Camping/el_Ghdir_Ain_Drahem/image4.jpg"],
      "Aïn Drahem is a small town in the North-West of Tunisia (Jendouba governorate) located about 20km south of Tabarka, it is characterized by greenery, open landscapes where the eye can only look into infinity. This marvelous city, with its mountains, waterfalls and trails, is a delight for hikers, photographers or simple people who like to walk freely and admire the beauty of the region. This place offers you the chance to admire its greenery and to live an exceptional camping experience.",
      "https://goo.gl/maps/tLR3wK9hMjmaTEuV8",
      "60DT",
    ),
    Acts(
      " Bizerte",
      "Cap Serrat",
      ["assets/images/activities/Camping/Cap_serta_bizerte/image1.jpg",
        "assets/images/activities/Camping/Cap_serta_bizerte/image2.jpg",
        "assets/images/activities/Camping/Cap_serta_bizerte/image3.jpg",
        "assets/images/activities/Camping/Cap_serta_bizerte/image4.jpg",
        "assets/images/activities/Camping/Cap_serta_bizerte/image5.jpg",
        "assets/images/activities/Camping/Cap_serta_bizerte/image6.jpg",],
      "With its picturesque old port, beautiful beaches, atmospheric corniche and great restaurants, Bizerte also has some amazing camping spots to offer,Cap Serrat being,hands down, the best.",
      "https://goo.gl/maps/BAjCAygUfiXdJJj98",
      "",
    ),
    Acts(
      " Nefza, Beja",
      "Cap Negro",
      ["assets/images/activities/Camping/nefza_beja/image1.jpg",
        "assets/images/activities/Camping/nefza_beja/image2.jpg",],
      "Cap Negro is a paradise located between sea and forest in the northwest of Tunisia. It is located about 10km from Nefza, and about 20km from Tabarka. Cap Negro is a life-size painting. On one side, an emerald coloured sea, clear and limpid. And on the other side, a forest as far as the eye can see. The access to the beach is not easy, it will be necessary to exceed the 8km of track and count almost 3 hours of road from Tunis. But the Camping journey in such a unique place is worth it, because the place is magical. Cap Negro is the certainty of spending a beautiful day at the beach, in absolute calm, and far from everything.",
      "https://goo.gl/maps/9SXkRff9fYZ9f7x46",
      "",
    ),
  ];
}

List<Acts> getDiscoveryList(){
  return <Acts>[
    Acts(
      " Beja",
      "Barrage Kasseb",
      ["assets/images/activities/Discovery/barrage_kaseb_beja/image1.jpg",
        "assets/images/activities/Discovery/barrage_kaseb_beja/image2.jpg",],
      "The Kasseb dam is a Tunisian dam inaugurated in 1969, located about twenty kilometers west of Beja . With a height of 57.6 meters and a crest length of 245 meters, it can retain up to 80 million cubic meters of water in a reservoir with an area of 437 hectares . The water in the reservoir is mainly intended for the drinking water supply of the city of Tunis and not for irrigation. The dam has a spillway 51 meters long with a maximum flow of 460 cubic meters per second. A hydroelectric plant with a capacity of 660 kW is located 400 meters downstream of the dam.",
      "https://goo.gl/maps/S893LatTM8DNuycu6",
      "",
    ),
    Acts(
      " Camp Mars",
      "Tembaine, Kebili",
      ["assets/images/activities/Discovery/desert/image1.png",
        "assets/images/activities/Discovery/desert/image2.png",],
      "In the Sahara, in the heart of the Great Eastern Erg, stands Timbaine -The mountain that is seen from afar-That's where the Mars camp landed. In the hollow of the dunes, Camp Mars goes beyond accomodation that combines ecology with comfort and friendliness, it is like a planet that offers an experience to live, out of time and space, in communion with the immensity of the desert and its stars. Camp Mars is located in Timbaine in the middle of the Grand Eg Oriental, 100km south of Douz, in the area of Jebil National Park.",
      "https://goo.gl/maps/qBd9n5MXWHAmcWwH9",
      "",
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
      "A world away from the organic jumble of the medina, Tunis' ville nouvelle was developed during the French colonial era. Its main core is Avenue Habib Bourguiba - a magnificently wide avenue planted with palms and eucalyptus trees.  The imposing St. Vincent de Paul Cathedral is the largest surviving building of Tunisia's French colonial period. Architecture fans should check out the wonderful mix of colonial and post-colonial buildings along Avenue Habib Bourguiba, from the Modernist inverted pyramid of Hotel du Lac to the more genteel and grand European-style of the government buildings. At the intersection with Avenue Mohammed V, Place d'Afrique has a clock monument symbolizing Tunisia's modern era.",
      "https://goo.gl/maps/6yVs1rr6sMuRieqAA",
      "",
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
      "This sprawling maze of ancient streets and alleyways is one of the most impressive medieval medinas in North Africa and one of Tunisia's great treasures. It's home to numerous covered souqs selling everything from shoes to shisha pipes, as well as bustling cafes, back streets full of artisans at work and residential areas punctuated by grand, brightly painted doorways. Historic palaces, hammams, mosques and madrassas (schools for study of the Quran) are scattered throughout, many lavishly decorated with tiles, carved stucco and marble columns.",
      "https://goo.gl/maps/77awDfdstEAYTjop6",
      "",
    ),
    Acts(
      " Tozeur",
      "Oasis",
      [
        "assets/images/activities/Discovery/oasis/image2.jpg",
        "assets/images/activities/Discovery/oasis/image3.jpg",
        "assets/images/activities/Discovery/oasis/image4.jpg",
        "assets/images/activities/Discovery/oasis/image5.jpg"],
      "Tozeur is a world apart from coastal Tunisian resorts such as Sousse and Hammamet, with a medina (old town) full of unique brick-pattern architecture and a rambling palm grove that slices a sea of green through the desert sand. Tozeur's beautiful date-palm oasis is a serene and tranquil world.",
      "https://goo.gl/maps/LaSht2a7REKfATub7",
      "",
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
      "Sbeitla is a small town in the central west region of Tunisia, 250km from Tunis. It is known for its remarkable Roman site and its Capital, made up of not one but three temples, dedicated to Minerva, Jupiter and Juno, the gods who protected Rome.",
      "https://goo.gl/maps/WKqzu59UkeXRMGei6",
      "",
   ),
   Acts(
      " Tunis",
      "Sidi Bou Said",
      ["assets/images/activities/Discovery/Sidi_Bou_Said/image1.jpg",
        "assets/images/activities/Discovery/Sidi_Bou_Said/image2.jpg",
        "assets/images/activities/Discovery/Sidi_Bou_Said/image3.jpg",
        "assets/images/activities/Discovery/Sidi_Bou_Said/image4.jpg",
        "assets/images/activities/Discovery/Sidi_Bou_Said/image5.jpg",
        "assets/images/activities/Discovery/Sidi_Bou_Said/image6.jpg"],
      "With its distinctive blue-and-white colour scheme, cobbled streets and jaw-dropping glimpses of azure waters, the cliff-top village of Sidi Bou Saïd is one of the prettiest spots in Tunisia. Named after a 13th-century Sufi saint, its distinctive architecture is a mix of the Ottoman and the Andalusian, a result of the influx of Spanish Muslims in the 16th century.",
      "https://goo.gl/maps/R1RvZzU6qXYNkwMT8",
      "",
    ),
  ];
}
List<Acts> getHikingList(){
  return <Acts>[
    Acts(
      " Bizerte",
      "Cap Farina",
      ["assets/images/activities/Hiking/Capwabna/image1.jpg",
        "assets/images/activities/Hiking/Capwabna/image2.jpg",
        "assets/images/activities/Hiking/Capwabna/image3.jpg"],
      "Cape Farina is a headland in Bizerte Governorate, Tunisia. It forms the northwestern end of the Gulf of Tunis. The Tunisian towns of Ghar el-Melh, Rafraf, Lahmeri, and the beach of Plage Sidi Ali Mekki Est are located along the peninsula.",
      "https://goo.gl/maps/1affwfRV6rNYodUA6",
      "",
    ),
    Acts(
      " Ben Arous",
      "Jbal Rsas",
      ["assets/images/activities/Hiking/jbal_rsas_ben_arous/image1.jpg",
        "assets/images/activities/Hiking/jbal_rsas_ben_arous/image2.jpg",
        "assets/images/activities/Hiking/jbal_rsas_ben_arous/image3.jpg",
        "assets/images/activities/Hiking/jbal_rsas_ben_arous/image4.jpg",
        "assets/images/activities/Hiking/jbal_rsas_ben_arous/image5.jpg"],
      "Djebel Ressas is a high and rugged outcropping of Jurassic limestone situated on the horizon southeast of Tunis, Tunisia. Competing in the foreground, the familiar profile of Djebel Boukornine may appear taller, but at 795 metres Ressas is the dominant peak.",
      "https://goo.gl/maps/wAo2FbtoHYAktP6u7",
      "",
    ),
  ];
}
List<Acts> getJetSkiList(){
  return <Acts>[
    Acts(
      " Djerba",
      "Watersports Sirens",
      ["assets/images/activities/Jet_ski/Djerba/image1.jpg"],
      "Ride a jet ski along Djerba's coastline and experience the island from a different perspective. If you like adrenaline, accelerate and jump or choose a calmer speed to enjoy your ride.",
      "https://goo.gl/maps/Fm8Coz1LyxukneG2A",
      "100DT",
    ),
    Acts(
      " Hammamet",
      "Nautic Base",
      ["assets/images/activities/Jet_ski/hammamet/image1.jpeg"],
      "Stretched out across Cap Bon's southeastern coast like a lazy sunbather, laid-back Hammamet (‘the baths’ in Arabic) is Tunisia's original resort town.However if you are looking for a ride on the jetski in the wide mediterranean sea then this is for you.",
      "https://goo.gl/maps/JFnYiDTyBSRHqDCP9",
      "100DT",
    ),
    Acts(
      " Sousse",
      "Watersports Center",
      ["assets/images/activities/Jet_ski/sousse/image1.jpg"],
      "The Sousse watersports center invites you to live pleasant sporting moments by offering you the chance to explore the beach in the right way by Jet Ski. It is a sport that combines pleasure and sensations, an exceptional discipline that promotes the spirit of adventure.",
      "https://goo.gl/maps/ouzo4KhJvRCwoKx26",
      "100DT",
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
      "Stretched out across Cap Bon's southeastern coast like a lazy sunbather, laid-back Hammamet (‘the baths’ in Arabic) is Tunisia's original resort town.However if you are looking for some parachuting thrill in your trip this watersports center is the go to.",
      "https://goo.gl/maps/JFnYiDTyBSRHqDCP9",
      "60DT",
    ),
    Acts(
      " Mahdia",
      "Parachute",
      ["assets/images/activities/Parachute/Mahdia/image1.jpg"],
      "Occupying a narrow peninsula jutting out into the Mediterranean, Mahdia is blessed with a truly spectacular setting and truly mesmerizing beaches. Parachute lover ? Then this is definitely not a bad idea.",
      "https://goo.gl/maps/jCseNHwzaj4KaFFM6",
      "60DT",
    ),
  ];
}
List<Acts> getScubaDiveList(){
  return <Acts>[
     Acts(
      " Bizerte",
      "Galite Islands",
      ["assets/images/activities/Scuba_dive/galite_islands/image1.jpg",
        "assets/images/activities/Scuba_dive/galite_islands/image2.jpg",
        "assets/images/activities/Scuba_dive/galite_islands/image3.jpg",
        "assets/images/activities/Scuba_dive/galite_islands/image4.jpg"],
      "In Tabarka, you’ll have the chance to spot a variety of marine creatures, from the eye-catching pink Swallowtail sea perch to the large dusky grouper that will swim right up to you. To add a bit of variety if you’re planning to do several dives over your trip, you could opt for a night dive or try an all-day trip to the beautiful Galite Islands, around three hours from Tabarka. The uninhabited islands offer divers spectacular views and a mesmerising array of sea life.",
      "https://goo.gl/maps/zjYJHmqv1ds7fG9s7",
      "150DT - 3 Hours",
    ),
    Acts(
      " Djerba",
      "Club Djerba plongée",
      ["assets/images/activities/Scuba_dive/djerba/image1.jpg",
        "assets/images/activities/Scuba_dive/djerba/image2.jpg",
        "assets/images/activities/Scuba_dive/djerba/image3.jpg"],
      "Adults and children, beginners or professionals, you will have the opportunity to practice scuba diving with highly qualified and experienced professionals in the field of diving, hunting and general underwater work. Discover breathtaking and unique views into the depths underwater of the island of Djerba.",
      "https://goo.gl/maps/EsEHyTLc4QYCCHJKA",
      "150DT - 3 Hours",
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
      "El Djem Archaeological Museum is an archaeological museum located in El Djem, Tunisia. It contains Roman era art, including mythological personages, abstract elements and fauna.",
      "https://goo.gl/maps/5ZggFzQ9afxw7BRa7",
      "12DT",
    ),
    Acts(
      " Tunis",
      "Bardo Museum",
      ["assets/images/activities/Visiting_museums/bardo_museum/image1.jpg",
        "assets/images/activities/Visiting_museums/bardo_museum/image2.jpg"],
      "The Bardo National Museum is a museum of Tunis, Tunisia, located in the suburbs of Le Bardo. It is one of the most important museums in the Mediterranean region and the second museum of the African continent after the Egyptian Museum of Cairo by the richness of its collections. The museum includes touching testimonies of the creativity of each of the Tunisian regions since 40,000 years.",
      "https://goo.gl/maps/jgFoj7wenkidTNwe7",
      "13DT",
    ),
    Acts(
      " Djerba",
      "Lalla Hadria Museum",
      ["assets/images/activities/Visiting_museums/Lalla_Hadria_Museum_Djerba/image1.png",
        "assets/images/activities/Visiting_museums/Lalla_Hadria_Museum_Djerba/image2.png"],
      "Discover over 13 centuries of Arabo-Islamic art and culture at Lalla Hadria Museum. The modern building displays a vast collection of art and artifacts across 15 rooms, with over 1,000 pieces. Take a tour around the grand site, and see the exhibits of jewelry, paintings, old furniture, and carpets. Look for the special room dedicated to the display of traditional handmade jewelry.",
      "https://goo.gl/maps/qeDuXFXD6B86SL9FA",
      "",
    ),
    Acts(
      " Djerba",
      "Guellala Museum",
      ["assets/images/activities/Visiting_museums/Musee_de_Guellala_Djerba/image1.png",
        "assets/images/activities/Visiting_museums/Musee_de_Guellala_Djerba/image2.png",
        "assets/images/activities/Visiting_museums/Musee_de_Guellala_Djerba/image3.png"],
      "Musee de Guellala remains dedicated to the folk art and traditions of Djerba's inhabitants. See traditional clothing and learn about Djerban wedding ceremonies and circumcision rituals, during which the displayed costumes are usually worn. The museum also contains a large collection of pottery. Pay a visit to the gift shop to pick up a small, handcrafted memento of your time on the island.",
      " https://goo.gl/maps/HqdyNwF4Q6T72JH8A",
      "3DT",
    ),
  ];
}