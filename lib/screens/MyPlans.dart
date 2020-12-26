import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';


class Plans extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Plans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body:Center(child: Text('Slt Sa7bi',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),)),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showMyDialog(context);
        },
        child:  Icon(Icons.add,size: 27.0,),
        backgroundColor: Colors.orange[600],
      ),
    );
  }
  var selectedCity = "None";
  List<String> cities = <String>[
    'Sousse',
    'Monastir',
    'Djerba',
    'Tunis',
    'Bizerte',
    'Hammamet',
    'sidi bou',
  ];
  Row buildScrollRow(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text('Choose City:      ',style: TextStyle(fontWeight: FontWeight.bold),),

        Card(
          elevation: 2,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Container(
            width: 120.0,
            height: 35.0,

            child: RaisedButton(
              child: Text(selectedCity),
              onPressed: () => showMaterialScrollPicker(
                context: context,
                maxLongSide: 350.0,
                headerColor: Colors.teal[200],
                headerTextColor: Colors.black,
                showDivider: false,
                title: "Pick Your City",
                items: cities,
                selectedItem: selectedCity,
                onChanged: (value){
                  selectedCity = value;
                  setState((){});
                    },
                onCancelled: () => print("Scroll Picker cancelled"),
                onConfirmed: ()  {
                  setState(() {});
                  print("Scroll Picker confirmed");
                },
              ),
            ),
          ),
        ),

      ],
    );
  }
  Future<void> _showMyDialog(context) async {
    final GlobalKey<FormState> globalKey=GlobalKey<FormState>();
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add New Plan'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: TextFormField(
                      // ignore: missing_return
                      validator:(value) {
                        if(value.isEmpty){
                          return ' Name is Empty';
                          // ignore: missing_return
                        }
                      },
                      onSaved: (value){

                      },
                      showCursor: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                  Navigator.of(context).pop();
                },

              ),
            ],
          );
        }
    );

  }
}




// showMaterialScrollPicker(
// context: context,
// title: "Pick Your City",
// items: usStates,
// selectedItem: selectedUsState,
// onChanged: (value) => setState(() => selectedUsState = value),
// );
