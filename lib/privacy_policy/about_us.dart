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

class AboutUs extends StatefulWidget {
  @override
  AboutUs({
    Key? key,
  }) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final ImagePicker picker = ImagePicker();

  File? _image1;

  String mail = "";
  String name1 = "";

  initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    //---------------------------------------------------------------------
    AppProvider appProvider = Provider.of<AppProvider>(context);
//-----------------------------------------------------------------------------------

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.shade100,
        title: const Text(
          "About Us",
          style: TextStyle(
              color: Colors.black54,
              fontFamily: "Ephesis",
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DashBoard();
                }));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "- Developers -",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Ephesis",
                    fontSize: 50),
              ),
            ),
          ),

          // image carousel begin here
          new Container(
            height: 260.0,
            child: Carousel(
              boxFit: BoxFit.cover,
              images: [
                AssetImage("images/developer/sahil.jpg"),
                AssetImage("images/developer/nakul.jpg"),
                AssetImage("images/developer/jayesh.jpg"),
                AssetImage("images/developer/shivani.jpg"),
              ],
              autoplay: true,
              animationCurve: Curves.fastLinearToSlowEaseIn,
              animationDuration: Duration(milliseconds: 4000),
              dotSize: 5.0,
              dotBgColor: Colors.black,
              indicatorBgPadding: 5.0,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CircleAvatar(
            radius: 40,
            child: Image(
              image: AssetImage(
                "images/developer/logo.png",
              ),
            ),
          ),

          Center(
            child: Text(
              "Rentify All",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Ephesis",
                  fontSize: 50),
            ),
          ),
          Center(
            child: Text(
              "Follow Your Dream",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.yellowAccent,
                  fontFamily: "Ephesis",
                  fontSize: 20),
            ),
          ),

          //  grid view
        ],
      ),
    );
  }
}
