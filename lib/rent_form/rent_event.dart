import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
//import 'dart:convert';

class RentService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String ref = "Events";
  void uploadProduct({
    String? hours,
    String? totalAmount,
    String? repOffice,
    String? dropLocation,
    String? name,
    String? email,
    String? phone,
    //  String? vehicles,
    String? date,
    String? takeTime,
    // String? backTime,
    String? vehicleName,
  }) {
    var id = new Uuid();
    String productId = id.v4();
    _firestore.collection(ref).doc(productId).set({
      '1.vehicle name': vehicleName,
      '2.name': name,
      '3.id': productId,
      '4.email': email,
      '5.phone': phone,
      // '6.vehicles': vehicles,
      '7.date': date,
      '8.takeTime': takeTime,
      //  '9.0 backTime': backTime,
      '9.1.hours': hours,
      '9.2.Total Amount': totalAmount,
      '9.3 Reporting Office': repOffice,
      '9.4 Droping Location': dropLocation,
    });
  }
}
