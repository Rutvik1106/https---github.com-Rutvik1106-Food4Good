import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:madproject/CharityDetails.dart';
import 'package:madproject/HomeScreen.dart';
import 'package:madproject/UserProfile.dart';
import 'package:madproject/helpers/ColorSys.dart';
class NavigationBar extends StatefulWidget {
  NavigationBar({Key key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
 int _selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen;
  final List<Widget> screens = <Widget>[
   HomeScreen(),
   CharityDetails(),
   UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child: screens.elementAt(_selectedIndex),
        ), 
        bottomNavigationBar:Container(  
          decoration: BoxDecoration(color: ColorSys.Black, boxShadow: [
            BoxShadow(blurRadius: 20, color: ColorSys.secoundry.withOpacity(.1))
          ]),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                  gap: 3,
                  activeColor: ColorSys.Green,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  tabBackgroundColor: Colors.transparent,
                  tabs: [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Home',
                      textColor: ColorSys.Green,
                      iconColor: Colors.white,
                    ),
                     GButton(
                      icon: LineIcons.plus,
                      text: 'Add Profile',
                     textColor: ColorSys.Green,
                      iconColor: Colors.white,
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'Profile',
                     textColor: ColorSys.Green,
                      iconColor: Colors.white,
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }),
            ),
          ),
        ),
    );
  }
}