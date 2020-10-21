import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:madproject/HomeScreen.dart';
import 'package:madproject/Navigation/Navigation.dart';
import 'package:madproject/helpers/ColorSys.dart';
import 'package:madproject/helpers/charityBundles.dart';

class CharityDetails extends StatefulWidget {
  @override
  _CharityDetailsState createState() => _CharityDetailsState();
}

class _CharityDetailsState extends State<CharityDetails> {
  int Value = 1;
  CharityBundle charityBundle = CharityBundle();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _dropDownValue;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        autovalidate: true,
        key: _formKey,
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 90.0, 0.0, 0.0),
                    child: Text(
                      'Enter',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 155.0, 0.0, 0.0),
                    child: Text(
                      'Charity Details.',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onSaved: (newValue) {
                      charityBundle.title = newValue;
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: ColorSys.gray,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorSys.Green,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     labelText: 'Type',
                  //     labelStyle: TextStyle(
                  //       fontFamily: 'Montserrat',
                  //       fontWeight: FontWeight.bold,
                  //       color: ColorSys.gray,
                  //     ),
                  //     focusedBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(
                  //       color: ColorSys.secoundry,
                  //     )),
                  //   ),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  //   child: Row(
                  //     children: <Widget>[
                  //       Text(
                  //         "Type:",
                  //         style: TextStyle(
                  //           fontFamily: 'Montserrat',
                  //           fontWeight: FontWeight.bold,
                  //           color: ColorSys.gray,
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 20.0,
                  //       ),
                  //       Container(
                  //         padding: EdgeInsets.only(left: 10.0),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10.0),
                  //             color: Colors.transparent),
                  //         child: DropdownButton(
                  //           value: Value,
                  //           items: [
                  //             DropdownMenuItem(
                  //               child: Text("Poor People",
                  //                   style: TextStyle(
                  //                     color: Colors.black,
                  //                   )),
                  //               value: 1,
                  //             ),
                  //             DropdownMenuItem(
                  //               child: Text("Animal"),
                  //               value: 2,
                  //             ),
                  //             DropdownMenuItem(
                  //               child: Text("Old Age People"),
                  //               value: 3,
                  //             ),
                  //             DropdownMenuItem(
                  //               child: Text("Children"),
                  //               value: 4,
                  //             ),
                  //             DropdownMenuItem(
                  //               child: Text("Handicaps"),
                  //               value: 5,
                  //             ),
                  //           ],
                  //           onChanged: (value) {
                  //             setState(() {
                  //               charityBundle.type = value;
                  //             });
                  //           },
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: DropdownButton(
                      iconEnabledColor: Colors.grey,
                      hint: _dropDownValue == null
                          ? Text('Type')
                          : Text(
                              _dropDownValue,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                      ),
                      items: [
                        'Poor People',
                        'Animal',
                        'Old Age people',
                        'Childrens',
                        'Handicaps'
                      ].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            _dropDownValue = val;
                            charityBundle.type = val;
                          },
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      charityBundle.address = newValue;
                    },
                    decoration: InputDecoration(
                      labelText: 'Address',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: ColorSys.gray,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: ColorSys.Green,
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      charityBundle.phoneNo = newValue;
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone No',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: ColorSys.gray,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: ColorSys.Green,
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      charityBundle.description = newValue;
                    },
                    decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: ColorSys.gray,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: ColorSys.Green,
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 60.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(35.0),
                      //shadowColor: ColorSys.secoundry,
                      color: ColorSys.Black,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          _formKey.currentState.save();
                          addCharityData(charityBundle);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NavigationBar();
                          }));
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     // if (!_formKey.currentState.validate()) {
                          //     //   return;
                          //     // }
                          //     // _formKey.currentState.save();
                          //     addCharityData(charityBundle);
                          //   },
                          // ));
                        },
                        child: Center(
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                                color: ColorSys.Green,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

addCharityData(CharityBundle charity) async {
  final reference = Firestore.instance.collection('charity');
  return await reference.document().setData(charity.toMap());
}

// void _submitForm() {
//   if (!_formKey.currentState.validate()) {
//     return;
//   }

//   _formKey.currentState.save();
// }
