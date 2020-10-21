import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:madproject/helpers/charityBundles.dart';
import 'package:madproject/helpers/size_config.dart';
import 'categories.dart';
import 'charity_bundle_cards.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: Column(children: <Widget>[
        // Categories(),
        
        child:Categories(),
        // Expanded(
        //   child: Padding(
        //     padding: EdgeInsets.symmetric(
        //         horizontal: SizeConfig.defaultSize * 2.5,
        //         vertical: SizeConfig.defaultSize * 1.5),
        //     child: GridView.builder(
        //       // itemCount: charityBundles.length,
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount:
        //             SizeConfig.orientation == Orientation.landscape ? 2 : 1,
        //         mainAxisSpacing: 20,
        //         crossAxisSpacing:
        //             SizeConfig.orientation == Orientation.landscape
        //                 ? SizeConfig.defaultSize * 2
        //                 : 0,
        //         childAspectRatio: 1.65,
        //       ),
        //       itemBuilder: (context, index) => CharityBundleCard(),
        //     ),
        //   ),
        // ),
      //]),
    );
  }
}
