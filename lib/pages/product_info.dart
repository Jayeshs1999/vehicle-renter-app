import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final String product_info;
  const ProductInfo({Key? key, required this.product_info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget s;

    if (product_info == "BMW") {
      s = Text("The BMW X1 has 1 Diesel Engine and 1 Petrol Engine on offer.+"
              "The Diesel engine is 1995 cc while the Petrol engine is 1998 cc ." +
          "It is available with Automatic transmission.Depending upon the" +
          "variant and fuel type the X1 has a mileage of 14.82 to 19.62 kmpl." +
          "The X1 is a 5 seater 4 cylinder car and has length of 4447mm, width" +
          "of 2060mm and a wheelbase of 2670mm.");
    } else if (product_info == "Hero lectra") {
      s = Text("The BMW X1 has 1 Diesel Engine and 1 Petrol Engine on offer.+"
              "The Diesel engine is 1995 cc while the Petrol engine is 1998 cc ." +
          "It is available with Automatic transmission.Depending upon the" +
          "");
    } else if (product_info == "Honda SP-125") {
      s = Text("The BMW X1 has 1 Diesel Engine and 1 Petrol Engine on offer.+"
              "The Diesel engine is 1995 cc while the Petrol engine is 1998 cc ." +
          "It is available with Automatic transmission.Depending upon the" +
          "");
    } else if (product_info == "Volvo-s60") {
      s = Text("The BMW X1 has 1 Diesel Engine and 1 Petrol Engine on offer.+"
              "The Diesel engine is 1995 cc while the Petrol engine is 1998 cc ." +
          "It is available with Automatic transmission.Depending upon the" +
          "");
    } else {
      s = Text("The BMW X1 has 1 Diesel Engine and 1 Petrol Engine on offer.+"
              "The Diesel engine is 1995 cc while the Petrol engine is 1998 cc ." +
          "It is available with Automatic transmission.Depending upon the" +
          "variant and fuel type the X1 has a mileage of 14.82 to 19.62 kmpl." +
          "The X1 is a 5 seater 4 cylinder car and has length of 4447mm, width" +
          "of 2060mm and a wheelbase of 2670mm.");
    }
    return s;
  }
}
