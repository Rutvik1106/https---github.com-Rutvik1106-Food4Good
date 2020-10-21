import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:madproject/CharityDetails.dart';
import 'package:madproject/HomeScreen.dart';
import 'package:madproject/Navigation/Navigation.dart';
import 'package:madproject/SignUp.dart';
import 'package:madproject/services/wrapper.dart';
import 'package:madproject/helpers/ColorSys.dart';
import 'package:madproject/services/GoogleAuth.dart';
import 'package:madproject/services/auth.dart';
import 'package:email_validator/email_validator.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => new _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static String email, password;
  final _text = TextEditingController();
  final _pass = TextEditingController();
  bool _validate = false;
  bool isValidEmail = false;
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                    child: Text(
                      'There',
                      style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onChanged: (val) {
                      email = val;
                      if (EmailValidator.validate(email)) {
                        isValidEmail = true;
                      } else {
                        isValidEmail = false;
                        ErrorDescription("Please check email");
                      }
                    },
                    controller: _text,
                    decoration: InputDecoration(
                      labelText: 'EMAIL',
                      //  errorText: _validate ? 'This Field Can not be empty' : null,
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
                  TextFormField(
                    onChanged: (val) {
                      password = val;
                    },
                    controller: _pass,
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      // errorText: _validate ? 'This Field Can not be empty' : null,
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
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  GestureDetector(
                    onTap: () async {
                      //setState(() async {
                        // _text.text.toString().isEmpty
                        //     ? _validate = true
                        //     : _validate = false;
                        //print(isValidEmail);
                        // EmailValidator.validate(email)
                        //     ? isValidEmail = true
                        //     : isValidEmail = false;
                        // if (!isValidEmail ||
                        //     _text.text.toString().isEmpty ||
                        //     _pass.text.toString().isEmpty) {
                        //   print(isValidEmail);
                        //   showDialog(
                        //     context: context,
                        //     builder: (context) => AlertDialog(
                        //       content:
                        //           Text("Please Check Your Email and Password"),
                        //     ),
                        //   );
                        // } else if (_text.text.toString().isNotEmpty &&
                        //     _pass.text.toString().isNotEmpty) {
                        //   print("Email Varified");
                          AuthService _auth = AuthService();
                          await _auth.signInWithEmailAndPassword(
                              email, password,context);
                       // }
                        print("out of else part");
                      //});
                    },
                    child: Container(
                      height: 60.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(35.0),
                        //shadowColor: ColorSys.Green,
                        color: ColorSys.Black,
                        elevation: 7.0,
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: ColorSys.Green,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      googleSignIn();
                    },
                    child: Container(
                      height: 60.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: ImageIcon(
                                  AssetImage('assets/images/google.png')),
                            ),
                            SizedBox(width: 10.0),
                            Center(
                              child: Text(
                                'Login With Google',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New To app ?',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUp();
                    }));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: ColorSys.Black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
