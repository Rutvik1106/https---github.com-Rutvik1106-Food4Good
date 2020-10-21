import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:madproject/HomeScreen.dart';
import 'package:madproject/Navigation/Navigation.dart';
import 'package:madproject/Notifier/categories_notifier.dart';
import 'package:madproject/services/auth.dart';
import 'package:madproject/services/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onBoarding.dart';
import 'package:provider/provider.dart';

int initScreen;
String user;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CategoriesNotifier(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: Wrapper(),

        initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
        routes: {
          "/": (context) => Wrapper(),
          "first": (context) => HomePage(),
        },
      ),
    );
  }
}
