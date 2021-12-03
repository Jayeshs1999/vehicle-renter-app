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
import 'package:rentify_all/privacy_policy/about_us.dart';
import 'package:rentify_all/privacy_policy/contact_us.dart';
import 'package:rentify_all/privacy_policy/privacy_policy.dart';
import 'package:rentify_all/temporary/DashBoard.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class HomePage extends StatefulWidget {
//   String email;
//   HomePage({Key? key, required this.email}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

class Categories extends StatefulWidget {
  @override
  String email, name;
  Categories({
    Key? key,
    required this.email,
    required this.name,
  }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final ImagePicker picker = ImagePicker();

  File? _image1;

  String mail = "";
  String name1 = "";

//keep user sign in
  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    mail = preferences.getString("email")!;
    // name1 = preferences.getString("name")!;
  }

  initState() {
    super.initState();
    getEmail();
  }

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
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.shade100,
        title: const Text(
          "RentifyAll",
          style: TextStyle(
              color: Colors.black54,
              fontFamily: "Ephesis",
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                this.widget.name,
                style: TextStyle(
                    fontFamily: "Ephesis",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(widget.email),
              // accountEmail: Text(email),
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
              decoration: BoxDecoration(color: Colors.pinkAccent.shade200),
            ),
            //body
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const ListTile(
                title: Text(
                  "Home Page",
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
              child: const ListTile(
                title: Text(
                  "About Us",
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
                leading: Icon(
                  Icons.info_rounded,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()));
              },
              child: const ListTile(
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
                leading: Icon(
                  Icons.privacy_tip_outlined,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUs()));
              },
              child: const ListTile(
                title: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
                leading: Icon(
                  Icons.contact_support_outlined,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),
            Divider(),

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
                title: Text(
                  "Log out",
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 30,
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
            child: Center(
              child: Text(
                "Categories",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontFamily: "Ephesis",
                    fontSize: 30),
              ),
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
