import 'dart:ui';

import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
          title: Text(
            "About Us",
            style: TextStyle(
                color: Colors.black54,
                fontFamily: "Ephesis",
                fontSize: 50,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: [
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Text(
            //       "Contact Us",
            //       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Welcome to SmartHub Private Limited, your number one source for all things [product]. We're dedicated to providing you the very best of [product], with an emphasis on [store characteristic 1], [store characteristic 2], [store characteristic 3].\n\n"
                  "Founded in 2021 by GECA MCA Group, SmartHub Private Limited has come a long way from its beginnings in Aurangabad. When GECA MCA Group first started out, their passion for  e.g. 'eco-friendly cleaning products' drove them to start their own business.\n\n"
                  "We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don't hesitate to contact us.\n\n"
                  "Sincerely,\n\n"
                  "GECA SY MCA Group"),
            )
          ],
        ));
  }
}
