import 'package:flutter/cupertino.dart';

class CategoriesNotifier with ChangeNotifier {
  var changeIndex;
  int get changeINdex => changeIndex;

  set changeINdex(int index) {
    changeIndex = index;

  }
}
