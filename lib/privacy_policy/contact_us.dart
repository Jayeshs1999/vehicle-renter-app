import 'dart:ui';

import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
          title: Text(
            "Contact Us",
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
              child: Text("You can contact us:\n\n"
                  "By email: smart.hub123@gmail.com\n\n"
                  "By phone number: 8888585093\n\n"
                  "By mail: 525 Kranti Chauk,SmartHub Pvt Limited ,424204, Aurangabad, Maharashtra,India"),
            )
          ],
        ));
  }
}
