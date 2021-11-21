import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
//import 'dart:convert';

class RentService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String ref = "Events";
  void uploadProduct({
    String? name,
    String? email,
    String? phone,
    String? vehicles,
    String? date,
    String? takeTime,
    String? backTime,
    String? hours,
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
      '6.vehicles': vehicles,
      '7.date': date,
      '8.takeTime': takeTime,
      '9.backTime': backTime,
      '9.0.hours': hours,
    });
  }
}
