import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:provider/provider.dart';
import 'package:trip/Commons/PlansModel.dart';
import 'package:trip/Provider/PlansProvider.dart';
import 'package:trip/useful//dropdownmenu.dart';
import 'package:trip/screens/Allactivities.dart';

import 'PlanDetails.dart';

class Plans extends StatefulWidget {
  bool variable = false;
  Plans({this.variable});
  @override
  _State createState() => _State();
}

class _State extends State<Plans> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    List<Plan> Myplans = Provider.of<Allplans>(context).Plans;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   leading:  Padding(
        //     padding: const EdgeInsets.only(left:8.0),
        //     child: Container(
        //             margin: EdgeInsets.only(right: 5, top: 5,),
        //             width: 50,
        //             child: CircleAvatar(
        //     backgroundImage: AssetImage('assets/images/LOGO.png'),
        //     foregroundColor: Colors.blue,
        //             ),
        //           ),
        //   ),
        //
        //
        //   title: Text(
        //     "My Plans",
        //     style: TextStyle(
        //       fontSize: 28,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.black,
        //     ),
        //   ),
        //   centerTitle: false,
        //   actions: <Widget>[
        //
        //
        //   ],
        // ),
        drawer: Drawer(),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image(
                  image: AssetImage(
                      "assets/images/cities/Nabeul/SightSeeing/118256632_351463602555376_2622677211289998929_n.jpg"),
                  fit: BoxFit.cover,
                ),
                Center(
                  child: ClipRect(
                    // <-- clips to the 200x200 [Container] below
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 15.0,
                        sigmaY: 15.0,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('    '),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: widget.variable ? 40.0 : 0,
                    ),
                    Container(
                      height: 600.0,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: Myplans.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 2,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              color: Colors.white.withOpacity(0.4),
                              child: Container(
                                color: Colors.white.withOpacity(0.4),
                                height: 80.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Padding(
                                        //   padding: const EdgeInsets.only(right: 28.0,top: 6.0),
                                        //   child: Center(child: Icon(Icons.add_circle_sharp,size: 30.0,)),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.place,
                                                size: 20.0,
                                                color: Colors.redAccent,
                                              ),
                                              Text(
                                                Myplans[index].Place,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PlanDetails(
                                                    plan1: Myplans[index],
                                                  )),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 60.0),
                                        child: Text(
                                          Myplans[index].Name,
                                          style: TextStyle(
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40.0,
                                      width: 40.0,
                                      child: SimpleAccountMenu(
                                        icons: [
                                          Icon(Icons.delete),
                                          Icon(Icons.add_circle_sharp),
                                        ],
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.5),
                                        iconColor: Colors.white,
                                        onChange: (index) {
                                          print(index);
                                          if (index == 0) {
                                            _showMyDialog2(context, Myplans[index]);
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyListView()),
                                            );
                                          }
                                        },
                                      ),
                                    )
                                    // child: Center(child: Icon(Icons.delete,size: 30.0,color: Colors.redAccent,)))),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 20.0,
                  bottom: 550.0,
                  right: 100.0,
                  left: 100.0,
                  child: Center(
                    child: Text(
                      "My Plans",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),Positioned(
                  top: 20.0,
                  bottom: 550.0,
                  right: 320.0,
                  child:widget.variable
                    ?IconButton(icon: Icon(Icons.arrow_back,size: 30.0,),onPressed: (){Navigator.pop(context);},)
                      :SizedBox()
                ),
              ],
            ),
          ),
        ),
        // ClipRect(
        //   child: BackdropFilter(
        //     filter: ImageFilter.blur(
        //       sigmaX:100.0,
        //       sigmaY: 100.0,
        //     ),
        //     child: Container(

        //         child: Center(child: Text('Slt Sa7bi',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),))),
        //   ),
        // ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 60.0),
          child: FloatingActionButton(
            onPressed: () {
              _showMyDialog(context);
            },
            child: Icon(
              Icons.add,
              size: 27.0,
            ),
            backgroundColor: Colors.orange[600],
          ),
        ));
  }

  List<String> cities = <String>[
    "None",
    'Sousse',
    'Monastir',
    'Djerba',
    'Tunis',
    'Bizerte',
    'Hammamet',
    'sidi bou',
  ];
  var selectedCity = "None";
  Row buildScrollRow(
    BuildContext context,
  ) {
    selectedCity = Provider.of<Allplans>(
      context,
    ).Ville;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          'Choose City:      ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Card(
          elevation: 2,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Container(
            width: 100.0,
            height: 35.0,
            child: RaisedButton(
              onPressed: () => showMaterialScrollPicker(
                context: context,
                maxLongSide: 350.0,
                headerColor: Colors.teal[200],
                headerTextColor: Colors.black,
                showDivider: false,
                title: "Pick Your City",
                items: cities,
                selectedItem: selectedCity,
                onChanged: (value) {
                  Provider.of<Allplans>(context, listen: false).addville(value);
                },
                onCancelled: () => print("Scroll Picker cancelled"),
                onConfirmed: () {
                  print("Scroll Picker confirmed");
                },
              ),
              child: Text(selectedCity),
            ),
          ),
        ),
      ],
    );
  }

  var planname = '123';
  Future<void> _showMyDialog(context) async {
    final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
    return showDialog<void>(
      useSafeArea: true,
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return Form(
            key: globalKey,
            child: AlertDialog(
              title: Text('Add New Plan'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        // ignore: missing_return
                        validator: (value) {
                          if (value.isEmpty) {
                            return ' Name is Empty';
                            // ignore: missing_return
                          }
                        },
                        onSaved: (value) {
                          planname = value;
                        },
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                            color: Color(0xFF666666),
                            fontWeight: FontWeight.bold,
                          ),
                          hintText: "Plan Name ",
                        ),
                      ),
                    ),
                    buildScrollRow(context),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                    child: Text('Create'),
                    onPressed: () {
                      if (globalKey.currentState.validate()) {
                        globalKey.currentState.save();
                        Provider.of<Allplans>(context, listen: false).addPlan(
                            Plan(
                                Place: Provider.of<Allplans>(context,
                                        listen: false)
                                    .Ville,
                                Name: planname,
                                activs: []));
                        Navigator.pop(context);
                      }
                    }),
              ],
            ),
          );
        });
  }

  Future<void> _showMyDialog2(context, Plan plan1) async {
    final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Are you sure you want to delete ${plan1.Name}?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            actions: <Widget>[
              Row(
                children: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(
                width: 70.0,
              ),
              TextButton(
                  child: Text('Delete'),
                  onPressed: () {
                    Provider.of<Allplans>(context, listen: false)
                        .deletePlan(plan1);
                    Navigator.of(context).pop();
                  }),
              SizedBox(
                width: 15.0,
              ),
            ],
          );
        });
  }
}

// showMaterialScrollPicker(
// context: context,
// title: "Pick Your City",
// items: usStates,
// selectedItem: selectedUsState,
// onChanged: (value) => setState(() => selectedUsState = value),
// );
