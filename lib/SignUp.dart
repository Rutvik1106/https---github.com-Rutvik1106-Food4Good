import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madproject/WelcomeScreen.dart';
import 'package:madproject/services/auth.dart';
import 'helpers/ColorSys.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email, password;
  final _text = TextEditingController();
  final _pass = TextEditingController();
  //bool _validate = false;
  bool isValidEmail = false;
  @override
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
                      'Signup',
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
              padding: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onChanged: (val) {
                      email = val;
                      if (EmailValidator.validate(email)) {
                        isValidEmail = true;
                      } else {
                        isValidEmail = false;
                      }
                    },
                    controller: _text,
                    decoration: InputDecoration(
                      labelText: 'EMAIL',
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
                      setState(() async {
                        if (!isValidEmail || _text.text.toString().isEmpty || _pass.text.toString().isEmpty) {
                          print(isValidEmail);
                          print("if part");
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content:
                                  Text("Please Check Your Email and Password"),
                            ),
                          );
                        } else if (_text.text.toString().isNotEmpty && _pass.text.toString().isNotEmpty) {
                          AuthService _auth = AuthService();
                          await _auth.registerWithEmailAndPassword(
                              email, password);
                          print("For pop");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return WelcomeScreen();
                          }));
                          // user.sendEmailVerification();
                        }
                      });
                    },
                    child: Container(
                      height: 60.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(35.0),
                        //shadowColor: ColorSys.secoundry,
                        color: ColorSys.Black,
                        elevation: 7.0,
                        child: Center(
                          child: Text(
                            'Sign Up',
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
                  Container(
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
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Text('Go Back',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
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
