import 'package:custom_page_route/custom_page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:rentify_all/components/cars.dart';
import 'package:rentify_all/models/product.dart';
import 'package:rentify_all/pages/login.dart';
import 'package:rentify_all/pages/product_details.dart';
import 'package:rentify_all/pages/signup.dart';

class Cars extends StatefulWidget {
  final String product_category;
  const Cars({Key? key, required this.product_category}) : super(key: key);

  @override
  _CarsState createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  var product_list = [
    {
      "name": "BMW",
      "picture": "images/cars/rent_cars/bmwx1.jpeg",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Volvo",
      "picture": "images/cars/rent_cars/volvos60.jpeg",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Honda HRV",
      "picture": "images/cars/rent_cars/hondahrv.jpg",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Tiago",
      "picture": "images/cars/Tiagotata.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Celerio",
      "picture": "images/cars/celerio.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Honda Accord Exl",
      "picture": "images/cars/rent_cars/ZHonda-accord exl.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Audi A5",
      "picture": "images/cars/rent_cars/ZAudi A5.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Honda Civic",
      "picture": "images/cars/rent_cars/ZHonda Civic.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "BMW 320i",
      "picture": "images/cars/rent_cars/Zbmw-320i.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Hyundai Santa Fe ",
      "picture": "images/cars/rent_cars/ZHyundai Santa Fe Sport.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Hyundai Venue",
      "picture": "images/cars/rent_cars/ZHyundai-Venue.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Hyundai Tucson ",
      "picture": "images/cars/rent_cars/ZHyundai Tucson 2020.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Kia Sorento",
      "picture": "images/cars/rent_cars/Zkia sorento Lx.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Mahendra Verito",
      "picture": "images/cars/rent_cars/Zmahendra-verito-toreador.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Hyundai Kona",
      "picture": "images/cars/rent_cars/ZSilver Hyundai Kona.png",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Red Hyundai",
      "picture": "images/cars/rent_cars/Zred_hundai.png",
      "old_price": "",
      "price": "Available",
    },
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
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
      ),
      body: GridView.builder(
          itemCount: product_list.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Single_prod(
              product_category: widget.product_category,
              prod_name: product_list[index]["name"],
              prod_picture: product_list[index]["picture"],
            );
          }),
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final product_category;

  Single_prod({this.prod_name, this.prod_picture, this.product_category});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
            tag: prod_name,
            child: Material(
              child: InkWell(
                  onTap: () {
                    // if (prod_name == "BMW") {
                    //-------------------------------
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
