import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:madproject/HomeScreen.dart';
import 'package:madproject/WelcomeScreen.dart';
import 'package:madproject/services/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'helpers/ColorSys.dart';
import 'helpers/Strings.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Future<void> _onIntroEnd(context) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => Wrapper()));
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 0, 0),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.fromLTRB(0, 50.0, 0.0, 0.0),
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Food For Good",
          body: "Helping people by charity is the most human thing",
          image: Image.asset('assets/images/food2.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Donate Food",
          body: "No one has ever become poor by giving food",
          image: Image.asset('assets/images/food3.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome",
          body: "We welcome you",
          image: Image.asset('assets/images/food4.jpg'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
