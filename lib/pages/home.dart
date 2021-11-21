import 'dart:io';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rentify_all/app_provider.dart';
import 'package:rentify_all/components/horizontal_listview.dart';
import 'package:rentify_all/components/products.dart';
import 'package:rentify_all/models/product.dart';
import 'package:rentify_all/pages/cart.dart';
import 'package:rentify_all/pages/login.dart';

// class HomePage extends StatefulWidget {
//   String email;
//   HomePage({Key? key, required this.email}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

class HomePage extends StatelessWidget {
  final ImagePicker picker = ImagePicker();
  File? _image1;

  @override
  String email, name;
  HomePage({
    Key? key,
    required this.email,
    required this.name,
  }) : super(key: key);

  Widget build(BuildContext context) {
    //---------------------------------------------------------------------
    AppProvider appProvider = Provider.of<AppProvider>(context);
//-----------------------------------------------------------------------------------
    Widget image_carousel = new Container(
      height: 160.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("images/cars/car1.jpg"),
          AssetImage("images/cars/car2.jpg"),
          AssetImage("images/cars/car3.jpg"),
          AssetImage("images/cars/bikes/bike1.jpg"),
          AssetImage("images/cars/rent_cars/hondahrv.jpg"),
          AssetImage("images/cars/bikes/bike3.jpg"),
        ],
        autoplay: true,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 4000),
        dotSize: 5.0,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 5.0,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: const Text("RentifyAll"),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Cart();
                }));
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              )),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(this.name),
              accountEmail: Text(email),
              currentAccountPicture: GestureDetector(
                child: const CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
            //body
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("Home Page"),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {},
            //   child: const ListTile(
            //     title: Text("My account"),
            //     leading: Icon(
            //       Icons.person,
            //       color: Colors.red,
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () {},
            //   child: const ListTile(
            //     title: Text("My Orders"),
            //     leading: Icon(
            //       Icons.shopping_basket,
            //       color: Colors.red,
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => Cart()));
            //   },
            //   child: const ListTile(
            //     title: Text("Shopping cart"),
            //     leading: Icon(
            //       Icons.shopping_cart,
            //       color: Colors.red,
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => Cart()));
            //   },
            //   child: const ListTile(
            //     title: Text("Favorites"),
            //     leading: Icon(
            //       Icons.favorite,
            //       color: Colors.red,
            //     ),
            //   ),
            // ),

            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: const ListTile(
                title: Text("Setting"),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.info_rounded,
                  color: Colors.blue,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Login(uname: "", uemail: "")))
                    });
              },
              child: const ListTile(
                title: Text("Log out"),
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          // image carousel begin here
          image_carousel,
          //  padding widgets
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Text(
          //     "Categories",
          //     style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: Colors.red,
          //         fontFamily: "times new roman"),
          //   ),
          // ),

          //horizontal list view begin here
          //  HorizontalList(),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Recent products",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontFamily: "times new roman"),
            ),
          ),

          //  grid view
          Container(height: 370.0, child: Products()),
          // Column(
          //   children: appProvider.featureProducts.map((e) => GestureDetector(
          //     child: Products(),
          //   )).toList(),
          // )
        ],
      ),
    );
  }
}
