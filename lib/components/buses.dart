import 'package:custom_page_route/custom_page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:rentify_all/pages/product_details.dart';

class Buses extends StatefulWidget {
  final product_category;
  const Buses({Key? key, this.product_category}) : super(key: key);

  @override
  _BusesState createState() => _BusesState();
}

class _BusesState extends State<Buses> {
  var product_list = [
    {
      "name": "Blue Premium 894",
      "picture": "images/buses/blue primium.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": " Orange Exp",
      "picture": "images/buses/orange_bus.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": " Blue Hexa",
      "picture": "images/buses/bluebus.png",
      "old_price": "",
      "price": "Available",
    },

    // {
    //   "name": "BMW",
    //   "picture": "images/companylogo/BMW.png",
    //   "old_price": "",
    //   "price": "Available",
    // },
    // {
    //   "name": "D",
    //   "picture": "images/cars/rent_cars/hondahrv.jpg",
    //   "old_price": "",
    //   "price": "Available",
    // },
    // {
    //   "name": "E",
    //   "picture": "images/cars/rent_cars/volvos60.jpeg",
    //   "old_price": "",
    //   "price": "Available",
    // },
    // {
    //   "name": "F",
    //   "picture": "images/cars/rent_cars/bmwx1.jpeg",
    //   "old_price": "",
    //   "price": "Available",
    // },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Products",
          style: TextStyle(
              color: Colors.black54,
              fontFamily: "Ephesis",
              fontSize: 50,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
          itemCount: product_list.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Single_prod(
              prod_name: product_list[index]["name"],
              prod_picture: product_list[index]["picture"],
              product_category: widget.product_category,
              // prod_old_price: product_list[index]["old_price"],
              // prod_price: product_list[index]["price"]
            );
          }),
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final product_category;
  // final prod_old_price;
  // final prod_price;

  Single_prod({this.prod_name, this.prod_picture, this.product_category
      // this.prod_old_price,
      // this.prod_price
      });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
            tag: prod_name,
            child: Material(
              child: InkWell(
                  onTap: () {
                    // if (prod_name == "BMW") {
                    //---------------------------------------------
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ProductDetails(
                    //               product_details_name: prod_name,
                    //               product_details_picture: prod_picture,
                    //             )));
                    Navigator.of(context).push(CustomPageRoute(
                        axisDirection: AxisDirection.left,
                        transitionDuration: Duration(milliseconds: 300),
                        child: ProductDetails(
                          product_category: product_category,
                          product_details_name: prod_name,
                          product_details_picture: prod_picture,
                        )));

//------------------

                    //}
                  },
                  child: GridTile(
                    footer: Container(
                        color: Colors.white70,
                        height: 30,
                        child: Row(
                          children: [
                            Expanded(
                                child: Center(
                              child: Text(
                                prod_name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            )),
                            // Text(
                            //   prod_price,
                            //   style: TextStyle(color: Colors.green),
                            // )
                          ],
                        )),
                    child: Image.asset(
                      prod_picture,
                      fit: BoxFit.fitWidth,
                    ),
                  )),
            )));
  }
}
