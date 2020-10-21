import 'package:flutter/material.dart';
import 'package:madproject/helpers/ColorSys.dart';

class CharityBundle {
  int id;
  String title, phoneNo, address, description, type;
  Color color;
  CharityBundle();
  CharityBundle.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    phoneNo = data['address'];
    description = data['description'];
    type = data['type'];
    address = data['address'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'phoneNo': phoneNo,
      'description': description,
      'type': type,
      'address' : address,
    };
  }

  // CharityBundle(
  //     {this.id,
  //     this.address,
  //     this.phoneNo,
  //     this.title,
  //     this.description,
  //     this.imageSrc,
  //     this.color}
  //      );

}

// Demo list
// List<CharityBundle> charityBundles = [
//   CharityBundle(
//       id: 1,
//       address: "Block 1 xyz Complex,Opp abc Mall,pincode",
//       phoneNo: "1234567890",
//       title: "Name Of The Charity",
//       description: "We are helping poor people by providing them food",
//       imageSrc: "assets/images/Poor.jpg",
//       color: ColorSys.Black),
//   CharityBundle(
//     id: 2,
//     address: "Block 2 xyz Complex,Opp abc Mall,pincode",
//     phoneNo: "1314548975",
//     title: "Name Of The Charity",
//     description: "We are helping poor people by providing them food",
//     imageSrc: "assets/images/best_2020@2x.png",
//     color: Color(0xFF90AF17),
//   ),
//   CharityBundle(
//     id: 3,
//     address: "Block 3 xyz Complex,Opp abc Mall,pincode",
//     phoneNo: "2412357881",
//     title: "Name Of The Charity",
//     description: "We are helping poor people by providing them food",
//     imageSrc: "assets/images/food_court@2x.png",
//     color: Color(0xFF2DBBD8),
//   ),
// ];
