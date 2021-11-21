import 'package:custom_page_route/custom_page_route.dart';
import 'package:flutter/material.dart';
import 'package:rentify_all/main.dart';
import 'package:rentify_all/pages/product_info.dart';
import 'package:rentify_all/rent_form/rentform.dart';

import 'home.dart';

class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_details_new_price;
  final product_details_old_price;
  final product_details_picture;

  ProductDetails(
      {this.product_details_name,
      this.product_details_new_price,
      this.product_details_old_price,
      this.product_details_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: InkWell(
          child: Text(
            "Products",
            style: TextStyle(
                color: Colors.black54,
                fontFamily: "Ephesis",
                fontSize: 50,
                fontWeight: FontWeight.bold),
          ),
          // onTap: () => Navigator.pop(
          //     context, MaterialPageRoute(builder: (context) => HomePage())),
        ),
        // actions: <Widget>[
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.search,
        //         color: Colors.white,
        //       )),
        // ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                  color: Colors.white70,
                  child: Image.asset(widget.product_details_picture)),
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(
                    widget.product_details_name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ),

          //====================the first button===============
          // Row(
          //   children: [
          //     //==========size button==========
          //     Expanded(
          //         child: MaterialButton(
          //             onPressed: () {
          //               showDialog(
          //                   context: context,
          //                   builder: (context) {
          //                     return AlertDialog(
          //                       title: Text("color"),
          //                       content: Text("choose the color"),
          //                       actions: [
          //                         MaterialButton(
          //                           onPressed: () {
          //                             Navigator.of(context).pop(context);
          //                           },
          //                           child: Text("close"),
          //                         )
          //                       ],
          //                     );
          //                   });
          //             },
          //             color: Colors.white,
          //             textColor: Colors.grey,
          //             child: Row(
          //               children: [
          //                 Expanded(
          //                   child: Text("Color"),
          //                 ),
          //                 Expanded(
          //                   child: Icon(Icons.arrow_drop_down),
          //                 ),
          //               ],
          //             ))),

          //     Expanded(
          //         child: MaterialButton(
          //             onPressed: () {
          //               showDialog(
          //                   context: context,
          //                   builder: (context) {
          //                     return AlertDialog(
          //                       title: Text("Quatity"),
          //                       content: Text("How many items"),
          //                       actions: [
          //                         MaterialButton(
          //                           onPressed: () {
          //                             Navigator.of(context).pop(context);
          //                           },
          //                           child: Text("close"),
          //                         )
          //                       ],
          //                     );
          //                   });
          //             },
          //             color: Colors.white,
          //             textColor: Colors.grey,
          //             child: Row(
          //               children: [
          //                 Expanded(
          //                   child: Text("Quantity"),
          //                 ),
          //                 Expanded(
          //                   child: Icon(Icons.arrow_drop_down),
          //                 ),
          //               ],
          //             ))),
          //   ],
          // ),

          //====================the second button===============
          Row(
            children: [
              //==========size button==========
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => RentForm(
                      //             product_name: widget.product_details_name,
                      //             product_image:
                      //                 widget.product_details_picture)));
                      Navigator.of(context).push(CustomPageRoute(
                          axisDirection: AxisDirection.left,
                          transitionDuration: Duration(milliseconds: 300),
                          child: RentForm(
                              product_name: widget.product_details_name,
                              product_image: widget.product_details_picture)));
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("Rent Now")),
              )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ))
            ],
          ),

          Divider(),

          ListTile(
            title: Text("Product details"),
            subtitle: ProductInfo(
              product_info: widget.product_details_name,
            ),
            // Text("The BMW X1 has 1 Diesel Engine and 1 Petrol Engine on offer.+"
            //         "The Diesel engine is 1995 cc while the Petrol engine is 1998 cc ." +
            //     "It is available with Automatic transmission.Depending upon the" +
            //     "variant and fuel type the X1 has a mileage of 14.82 to 19.62 kmpl." +
            //     "The X1 is a 5 seater 4 cylinder car and has length of 4447mm, width" +
            //     "of 2060mm and a wheelbase of 2670mm."),
          ),
          Divider(),
          ListTile(
            title: Text("Key Specifications of BMW X1"),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5.0, 5, 5),
                child: Text(
                  "Product name          :",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(widget.product_details_name)),
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5.0, 5, 5),
                child: Text(
                  "Fuel Type                  :",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              //================remaimber to create product brand
              Padding(padding: EdgeInsets.all(5.0), child: Text("Diesel")),
            ],
          ),

          //----------add the product conditions
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5.0, 5, 5),
                child: Text(
                  "Seating Capacity     :",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0), child: Text("5")),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5.0, 5, 5),
                child: Text(
                  "Fuel Tank Capacity :",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0), child: Text("51.0")),
            ],
          ),
          Divider(),

          //==================Key Features of BMW X1======================
          ListTile(
            title: Text("Key Features of BMW X1 :"),
          ),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5.0, 5, 5),
                child: Text(
                  "Air Conditioner                     : ",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0), child: Text("Present")),
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5.0, 5, 5),
                child: Text(
                  "Anti Lock Braking System  :",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              //================remaimber to create product brand
              Padding(padding: EdgeInsets.all(5.0), child: Text(" Present")),
            ],
          ),

          //----------add the product conditions
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5.0, 5, 5),
                child: Text(
                  "Power Steering                     :",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0), child: Text("Present")),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5.0, 5, 5),
                child: Text(
                  "Automatic Climate Control :",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0), child: Text("Present")),
            ],
          ),

          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Similar products"),
          ),
          //================Similar Product section==========================
          Container(
            height: 360,
            child: Similar_products(),
          )
        ],
      ),
    );
  }

  late Widget s;
  Widget prod() {
    if (widget.product_details_name == "BMW") {
      s = Text("The BMW X1 has 1 Diesel Engine and 1 Petrol Engine on offer.+"
              "The Diesel engine is 1995 cc while the Petrol engine is 1998 cc ." +
          "It is available with Automatic transmission.Depending upon the" +
          "variant and fuel type the X1 has a mileage of 14.82 to 19.62 kmpl." +
          "The X1 is a 5 seater 4 cylinder car and has length of 4447mm, width" +
          "of 2060mm and a wheelbase of 2670mm.");
    } else if (widget.product_details_name == "Hero lectra") {
      s = Text("The BMW X1 has 1 Diesel Engine and 1 Petrol Engine on offer.+"
              "The Diesel engine is 1995 cc while the Petrol engine is 1998 cc ." +
          "It is available with Automatic transmission.Depending upon the" +
          "");
    }
    return s;
  }
  // Widget prod_info() {
  //   return Text("The BMW X1 has 1 Diesel Engine and 1 Petrol Engine on offer.+"
  //           "The Diesel engine is 1995 cc while the Petrol engine is 1998 cc ." +
  //       "It is available with Automatic transmission.Depending upon the" +
  //       "variant and fuel type the X1 has a mileage of 14.82 to 19.62 kmpl." +
  //       "The X1 is a 5 seater 4 cylinder car and has length of 4447mm, width" +
  //       "of 2060mm and a wheelbase of 2670mm.");
  // }
}

class Similar_products extends StatefulWidget {
  const Similar_products({Key? key}) : super(key: key);

  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var product_list = [
    {
      "name": "BMW X1",
      "picture": "images/cars/rent_cars/hondajazz.jpeg",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Honda SP-125",
      "picture": "images/rent_bikes/hondasp125.jpg",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Hero lectra",
      "picture": "images/rent_cycle/herolectro.jpg",
      "old_price": "",
      "price": "Available",
    },
    {
      "name": "Volvo-S60",
      "picture": "images/cars/rent_cars/volvos60.jpeg",
      "old_price": "",
      "price": "Available",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_single_prod(
              prod_name: product_list[index]["name"],
              prod_picture: product_list[index]["picture"],
              prod_old_price: product_list[index]["old_price"],
              prod_price: product_list[index]["price"]);
        });
  }
}

class Similar_single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
            tag: prod_name,
            child: Material(
              child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(

                      //here we are passing the values of the product to product detais page
                      builder: (context) => new ProductDetails(
                            product_details_name: prod_name,
                            product_details_new_price: prod_price,
                            product_details_old_price: prod_old_price,
                            product_details_picture: prod_picture,
                          ))),
                  child: GridTile(
                    footer: Container(
                        color: Colors.white70,
                        height: 30,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              prod_name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )),
                            Text(
                              prod_price,
                              style: TextStyle(color: Colors.green),
                            )
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
