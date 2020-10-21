import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String printEmail;
final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthService {
  // FirebaseUser varifyUser;

  // sign in with email and password
  Future signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      print("Varified");
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      printEmail = user.email;
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("email", printEmail);

       print(preferences.getString("email"));
      // user.sendEmailVerification();
      return user;
    } catch (e) {
      print(e.code);
      switch (e.code) {
        case 'error':
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text("Please Check Your Email and Password"),
            ),
          );
          break;
        case 'ERROR_USER_NOT_FOUND':
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text("Please Check Your Email and Password"),
            ),
          );
          break;
        case 'ERROR_INVALID_EMAIL':
          print('Invalid Email!');
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text("Please Check Your Email "),
            ),
          );
          break;
        case 'ERROR_WRONG_PASSWORD':
          print('Wrong Password');
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text("Please Check Your  Password"),
            ),
          );
          break;

          print(e);
      }
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // varifyUser = result.user;
      // varifyUser.sendEmailVerification();
      print("varification sent");
      //await DatabaseService(uid: user.uid).updateUserData(name, email);
      return user;
    } catch (e) {
      print(e);
    }
  }

  // sign out
  Future logout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  //stream
  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }
}
