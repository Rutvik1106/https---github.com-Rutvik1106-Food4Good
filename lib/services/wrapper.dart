import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madproject/HomeScreen.dart';
import 'package:madproject/Navigation/Navigation.dart';
import 'package:madproject/WelcomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import '../onBoarding.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    if (user == null)
      return WelcomeScreen();
    else
      return NavigationBar();
  }
}
