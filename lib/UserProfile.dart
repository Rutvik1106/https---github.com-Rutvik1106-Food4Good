import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madproject/WelcomeScreen.dart';
import 'package:madproject/helpers/charity_bundle_cards.dart';
import 'package:madproject/services/GoogleAuth.dart';
import 'package:madproject/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helpers/ColorSys.dart';

String email;

class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    getemail();
    //print(email);
  }

  void getemail() async {
    print("in function");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString("email");
    });
    //print(preferences.getString("email"));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 250,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  topBar(250),
                  Positioned(
                    top: 200,
                    child: Container(
                      width: width * 0.9,
                      margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                      child: Card(
                        color: Colors.white,
                        elevation: 25,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      25.0, 25.0, 50.0, 25.0),
                                  child: Image(
                                      height: 55,
                                      width: 55,
                                      image: AssetImage(
                                          'assets/images/avatar.png')),
                                ),
                                SizedBox(
                                  width: 100.0,
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      100.0, 37.0, 25.0, 25.0),
                                  child: Text(
                                    'User Information',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: height * 0.3,
                  child: Card(
                    elevation: 25,
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.fromLTRB(25.0, 100.0, 25.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              //color: Colors.white,
                              height: 70,
                              margin:
                                  EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                              child: ListTile(
                                leading:
                                    Icon(Icons.email, color: ColorSys.Black),
                                title: Text(email,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Montserrat',
                                    )),
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 80),
                                height: 40.0,
                                width: 160,
                                alignment: Alignment.center,
                                color: Colors.transparent,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black,
                                          style: BorderStyle.solid,
                                          width: 1.0),
                                      color: ColorSys.Black,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: InkWell(
                                    onTap: () async {
                                      //AuthService _auth = AuthService();
                                      //await _auth.logout();
                                      AuthService().logout();
                                      FirebaseUser user =
                                          await auth.currentUser();
                                      if (user.providerData[1].providerId ==
                                          'google.com') {
                                        await gooleSignIn.disconnect();
                                      }
                                      // return Navigator.push(context, MaterialPageRoute(
                                      //   builder: (context) {
                                      //     return WelcomeScreen();
                                      //   },
                                      // ));
                                    },
                                    child: Center(
                                      child: Text(
                                        'Logout',
                                        style: TextStyle(
                                          color: ColorSys.Green,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container topBar(double height) {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: Text(
          'Profile',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 25,
              letterSpacing: 1),
        ),
      ),
    );
  }
}
