import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rentify_all/pages/categories.dart';
import 'package:rentify_all/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _splashScreenBody();
  }
}

class _splashScreenBody extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Dicision();
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return Login(uname: "Hello User", uemail: "");
      // }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.pinkAccent.shade100),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 70,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.asset("images/splash_image/image.png"),
                          )),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text(
                        "Rentify All",
                        style: TextStyle(
                            color: Colors.black54,
                            fontFamily: "Ephesis",
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      "Follow your dream",
                      style: TextStyle(
                          color: Colors.amberAccent,
                          fontFamily: "Ephesis",
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void Dicision() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var email = preferences.getString('email');
    var name = preferences.getString('name');
    // if (name == null) {
    //   name = email!.substring(0, 7);
    // }
    email == null
        ? Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Login(
              uemail: email.toString(),
              uname: name.toString(),
            );
          }))
        : Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Categories(email: email, name: "${name.toString()}...");
          }));
  }
}
