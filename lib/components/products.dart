import 'package:custom_page_route/custom_page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:rentify_all/components/buses.dart';
import 'package:rentify_all/components/cars.dart';
import 'package:rentify_all/components/commercial.dart';
import 'package:rentify_all/components/two_weelers.dart';
import 'package:rentify_all/models/product.dart';
import 'package:rentify_all/pages/login.dart';
import 'package:rentify_all/pages/product_details.dart';
import 'package:rentify_all/pages/signup.dart';

class Products extends StatefulWidget {
  const Products({
    Key? key,
  }) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Cars",
      "picture": "images/cars/carlogo.jpg",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Two Weelers",
      "picture": "images/rent_bikes/bikelogo.jpg",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Buses",
      "picture": "images/buses/buslogo.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Commercial",
      "picture": "images/commercial/commerciallogo.png",
      "old_price": "",
      "price": "Available",
    },
    // {
    //   "name": "Volvo-S60",
    //   "picture": "images/cars/rent_cars/volvos60.jpeg",
    //   "old_price": "",
    //   "price": "Available",
    // },
    // {
    //   "name": "BMW-X1",
    //   "picture": "images/cars/rent_cars/bmwx1.jpeg",
    //   "old_price": "",
    //   "price": "Available",
    // },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]["name"],
            prod_picture: product_list[index]["picture"],
            // prod_old_price: product_list[index]["old_price"],
            // prod_price: product_list[index]["price"]
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  // final prod_old_price;
  // final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    // this.prod_old_price,
    // this.prod_price
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.greenAccent,
        elevation: 7,
        child: Hero(
            tag: prod_name,
            child: Material(
              child: InkWell(
                  highlightColor: Colors.pinkAccent.shade100,
                  splashColor: Colors.amber,
                  onTap: () {
                    if (prod_name == "Cars") {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Cars()));
                      Navigator.of(context).push(CustomPageRoute(
                          axisDirection: AxisDirection.left,
                          transitionDuration: Duration(milliseconds: 300),
                          child: Cars()));
                    } else if (prod_name == "Two Weelers") {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => TwoWeelers()));
                      Navigator.of(context).push(CustomPageRoute(
                          axisDirection: AxisDirection.left,
                          transitionDuration: Duration(milliseconds: 300),
                          child: TwoWeelers()));
                    } else if (prod_name == "Buses") {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Buses()));
                      Navigator.of(context).push(CustomPageRoute(
                          axisDirection: AxisDirection.left,
                          transitionDuration: Duration(milliseconds: 300),
                          child: Buses()));
                    } else if (prod_name == "Commercial") {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Commercial()));
                      Navigator.of(context).push(CustomPageRoute(
                          axisDirection: AxisDirection.left,
                          transitionDuration: Duration(milliseconds: 300),
                          child: Commercial()));
                    }
                  },
                  // Navigator.of(context).push(MaterialPageRoute(

                  //     //here we are passing the values of the product to product detais page
                  //     builder: (context) =>
                  //     //  ProductDetails(
                  //     //       product_details_name: prod_name,
                  //     //       // product_details_new_price: prod_price,
                  //     //       // product_details_old_price: prod_old_price,
                  //     //       product_details_picture: prod_picture,
                  //     //     )
                  //     )),
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

  // Widget PickUp() {

  //   if (prod_name == "Cars") {
  //     s = SignUp();

  //     // Navigator.push(
  //     //     context, MaterialPageRoute(builder: (context) => SignUp()));
  //   }

  // }
}
