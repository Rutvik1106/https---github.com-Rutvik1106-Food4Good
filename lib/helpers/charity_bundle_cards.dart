import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madproject/Notifier/categories_notifier.dart';
import 'package:madproject/helpers/categories.dart';
import 'package:madproject/helpers/size_config.dart';
import 'package:madproject/services/getType.dart';
import 'package:provider/provider.dart';
import 'charityBundles.dart';

class CharityBundleCard extends StatefulWidget {
  CharityBundleCard();

  @override
  _CharityBundleCardState createState() => _CharityBundleCardState();
}

class _CharityBundleCardState extends State<CharityBundleCard> {
  CharityBundle charityBundle;

  var tempIndex;
  var poor;
  var animal;
  var oldage;
  var children;
  var handicaps;
  @override
  void initState() {
    super.initState();
    tempIndex = selectedIndex;
    Gettype().getCharityType('Poor People').then((QuerySnapshot docs) {
      if (docs.documents.isNotEmpty) {
        for (int i = 0; i < docs.documents.length; i++) {
          print("in poor");
          print(docs.documents[i].data);
          poor = docs.documents[i].data;
        }
      }
    });
    Gettype().getCharityType('Animal').then((QuerySnapshot docs) {
      if (docs.documents.isNotEmpty) {
        for (int i = 0; i < docs.documents.length; i++) {
          print("in Animal");
          print(docs.documents[i].data);
          animal = docs.documents[i].data;
        }
      }
    });
    Gettype().getCharityType('Old Age people').then((QuerySnapshot docs) {
      if (docs.documents.isNotEmpty) {
        for (int i = 0; i < docs.documents.length; i++) {
          print("in oap");
          print(docs.documents[i].data);
          oldage = docs.documents[i].data;
        }
      }
    });
    Gettype().getCharityType('Childrens').then((QuerySnapshot docs) {
      if (docs.documents.isNotEmpty) {
        for (int i = 0; i < docs.documents.length; i++) {
          print("in Childrens");
          print(docs.documents[i].data);
          oldage = docs.documents[i].data;
        }
      }
    });
    Gettype().getCharityType('Handicaps').then((QuerySnapshot docs) {
      if (docs.documents.isNotEmpty) {
        for (int i = 0; i < docs.documents.length; i++) {
          print("in Handicaps");
          print(docs.documents[i].data);
          oldage = docs.documents[i].data;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CategoriesNotifier categoriesNotifier =
        Provider.of<CategoriesNotifier>(context);
    print("Notifier Print");
    print(categoriesNotifier.changeIndex);
    print("changed index");
    print(changedIndex);
    // if (tempIndex != selectedIndex) {
    //   setState(() {
    //     print("in if");
    //     tempIndex = selectedIndex;
    //   });
    // } else {
    //   print("in else");
    //   print(changedIndex);
    // }
    double defaultSize = SizeConfig.defaultSize;
    return StreamBuilder(
        stream: Firestore.instance
            .collection('charity')
            .where('type',
                isEqualTo: categories[selectedIndex])
            .snapshots(),
        builder: (context, snapshot) {
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print("tempIndex");
            print(categories[tempIndex]);

            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot snapshott = snapshot.data.documents[index];
                  print("${snapshott['type']}");
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(defaultSize * 1.0),
                      ),
                      // child: Row(
                      //   children: <Widget>[
                      child: Padding(
                        padding: EdgeInsets.all(defaultSize * 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Spacer(),
                            Text(
                              snapshott['title'],
                              style: TextStyle(
                                fontSize: defaultSize * 2.2,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: defaultSize * 0.5,
                            ),
                            Text(
                              snapshott['description'],
                              style: TextStyle(color: Colors.white),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                            buildInfoRow(defaultSize,
                                
                                iconSrc: "assets/images/phone.svg",
                                text: "${snapshott['phoneNo']}"),
                            SizedBox(
                              height: 10,
                            ),
                            buildInfoRow(defaultSize,
                                iconSrc: "assets/images/address.svg",
                                text: "${'rnpgrses'}"),
                            Spacer(),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   width: defaultSize * 0.5,
                      // ),
                      // AspectRatio(
                      //   aspectRatio: 0.85,
                      //   child: Image.asset(
                      //     charityBundles[0].imageSrc,
                      //     fit: BoxFit.cover,
                      //     alignment: Alignment.centerLeft,
                      //   ),
                      // )
                      // ],
                      //  ),
                    ),
                  );
                },
              ),
            );
          }
        });
  }

  Row buildInfoRow(double defaultSize, {String iconSrc, text}) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(iconSrc),
        SizedBox(
          width: defaultSize,
        ),
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
