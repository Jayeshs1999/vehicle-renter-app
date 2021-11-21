import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product {
  static const String BRAND = 'brand';
  static const String CATEGORY = 'category';
  static const String ID = 'id';
  static const String IMAGE_URL = 'imageUrl';
  static const String NAME = 'name';

//private variable------------------------------------
  late String _brand;
  late String _category;
  late String _id;
  late String _imageUrl;
  late String _name;

//getters
  String? get brand => _brand;
  String? get category => _category;
  String? get id => _id;
  String? get imageUrl => _imageUrl;
  String? get name => _name;

  // Products.fromSnapshot( snapshot) {
  //   _brand = snapshot.data[BRAND];
  //   _category = snapshot.data[CATEGORY];
  //   _id = snapshot.data[ID];
  //   _category = snapshot.data[PICTURE];

  // }

//name constructor---------------------------------

  Product.fromSnapshot(snapshot) {
    Map data = snapshot.data();
    _name = data[NAME];
    _brand = data[BRAND];
    _category = data[CATEGORY];
    _id = data[ID];
    _imageUrl = data[IMAGE_URL];
  }
}
