import 'package:flutter/material.dart';
import 'package:madproject/Notifier/categories_notifier.dart';
import 'package:madproject/helpers/charityBundles.dart';
import 'package:madproject/helpers/charity_bundle_cards.dart';
import 'package:madproject/helpers/size_config.dart';
import 'package:madproject/services/getType.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'ColorSys.dart';

//int tempIndex = 0;
List<String> categories = [
  "Poor People",
  "Animal",
  "Old Age people",
  "Childrens",
  "Handicaps"
];
int changedIndex;
int selectedIndex = 0;
getIndex(CategoriesNotifier notifier) {
  changedIndex = notifier.changeIndex;
}
// getData(CategoriesNotifier notifier) {
//    return Firestore.instance
//       .collection('charity')
//       .where('type', isEqualTo: categories[notifier.changeIndex])
//       .snapshots();
// }

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(

          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.defaultSize * 2,
          ),

          child: SizedBox(
            height: SizeConfig.defaultSize * 3.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => buildCategoriItem(index),
            ),
          ),
        ),
        CharityBundleCard(),
      ],
    );
  }

  Widget buildCategoriItem(int index) {
   CategoriesNotifier  categoriesNotifier =
        Provider.of<CategoriesNotifier>(context,listen: false);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          categoriesNotifier.changeIndex = selectedIndex;
         // print(categoriesNotifier.changeIndex);
          getIndex(categoriesNotifier);
          print("change Index");
          print(changedIndex);
          //print(getData(categoriesNotifier));
          // print(categoriesNotifier.changeINdex);
          //print(Gettype().getCharityType(categories[selectedIndex]).toString());
          // tempIndex = selectedIndex;
          // print(tempIndex);
          // print(tempIndex);
          // Gettype()
          //     .getCharityType(categories[selectedIndex])
          //     .then((QuerySnapshot docs) {
          //   if (docs.documents.isNotEmpty) {
          //     for (int i = 0; i < docs.documents.length; i++) {
          //       var cat = docs.documents[0].data;
          //       print(cat);
          //     }
          //   }
          // });
       });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize * 2),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 2,
          vertical: SizeConfig.defaultSize * 0.5,
        ),
        decoration: BoxDecoration(
          color: selectedIndex == index ? ColorSys.Black : Colors.transparent,
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize * 1.6),
        ),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? ColorSys.Green : ColorSys.Black,
          ),
        ),
      ),
    );
  }
}
