import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madproject/helpers/ColorSys.dart';
import 'package:madproject/helpers/body.dart';
import 'package:madproject/helpers/size_config.dart';
import 'helpers/Drawer.dart';
import 'package:madproject/helpers/charity_bundle_cards.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: ColorSys.Black,
        centerTitle: true,
        title: Text(
          'Food For Good',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorSys.Green,
            fontFamily: 'Montserrat',
          ),
        )
    );
  }
}
