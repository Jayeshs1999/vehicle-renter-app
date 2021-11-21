import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rentify_all/pages/product_details.dart';
import 'package:rentify_all/rent_form/rentform.dart';

class OrderSubmit extends StatefulWidget {
  const OrderSubmit({Key? key}) : super(key: key);

  @override
  State<OrderSubmit> createState() => _OrderSubmitState();
}

class _OrderSubmitState extends State<OrderSubmit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Icon(
              Icons.done_all_sharp,
              size: 200,
              color: Colors.green,
            ),
          ),
          Text(
            "Congratulation !",
            style: TextStyle(
                color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            "Your rent order is sucessfull",
            style: TextStyle(
                color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          // Center(
          //   child: SizedBox(
          //     height: 400,
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Card(
          //         color: Colors.greenAccent,
          //         elevation: 20,
          //         child: Column(
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Text(
          //                 "Note : 1 Please take screenshot of this page and refer below address and pick up vehicle",
          //                 style: TextStyle(
          //                     color: Colors.redAccent,
          //                     fontSize: 15,
          //                     fontWeight: FontWeight.bold),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Text(
          //                 "Note : 1 Please bring your Aadhar card/or PAN card or any identification proof with you.",
          //                 style: TextStyle(
          //                     color: Colors.redAccent,
          //                     fontSize: 15,
          //                     fontWeight: FontWeight.bold),
          //               ),
          //             ),
          //             SizedBox(
          //               height: 20,
          //             ),
          //             Text(
          //               "SmartHub Pvt Limited",
          //               style: TextStyle(
          //                   color: Colors.pinkAccent,
          //                   fontSize: 25,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //             SizedBox(
          //               height: 26,
          //             ),
          //             Text(
          //               "Near Bridge Kranti chauk aurangabad ",
          //               style: TextStyle(
          //                   color: Colors.pinkAccent,
          //                   fontSize: 17,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //             Text(
          //               "\t\t\t\t\t\t\t\tFor more details\n\t\tPhone no: 8888585093",
          //               style: TextStyle(
          //                   color: Colors.pinkAccent,
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //             Text(
          //               "Email :jayeshsevatkar55@gmail.com",
          //               style: TextStyle(
          //                   color: Colors.pinkAccent,
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //             SizedBox(
          //               height: 40,
          //             ),
          //             RaisedButton(
          //               color: Colors.redAccent,
          //               textColor: Colors.white,
          //               onPressed: () {
          //                 Navigator.pop(context);
          //               },
          //               child: Text("Back to product"),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
