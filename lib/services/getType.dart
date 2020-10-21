import 'package:cloud_firestore/cloud_firestore.dart';
class Gettype {
  getCharityType(String type) {
    return Firestore.instance.collection('charity').where('type', isEqualTo: type).getDocuments();
  }
}
