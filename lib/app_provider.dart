import 'package:flutter/cupertino.dart';
import 'package:rentify_all/db/products.dart';
import 'package:rentify_all/models/product.dart';

class AppProvider with ChangeNotifier {
  List<Product> _featureProducts = [];
  ProductService _productService = ProductService();

  AppProvider() {
    _getFeaturedProducts();
  }

  //getter

  List<Product> get featureProducts => _featureProducts;

  //methods

  void _getFeaturedProducts() async {
    _featureProducts = await _productService.getFeaturedProducts();
    notifyListeners();
  }
}
