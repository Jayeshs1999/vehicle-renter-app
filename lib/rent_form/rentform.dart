import 'dart:collection';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:rentify_all/db/products.dart';
import 'package:rentify_all/pages/home.dart';
import 'package:rentify_all/pages/login.dart';
import 'package:rentify_all/pages/order_submit.dart';
import 'package:rentify_all/rent_form/rent_event.dart';
import 'package:rentify_all/rent_form/terms_and_condition.dart';
import 'package:telephony/telephony.dart';

class RentForm extends StatefulWidget {
  String product_name, product_image, product_categories;
  RentForm(
      {Key? key,
      required this.product_name,
      required this.product_image,
      required this.product_categories})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return addQuery(
        product_name: this.product_name, product_image: product_image);
  }
}

class addQuery extends State<RentForm> {
  // final Telephony telephony=Telephony.instance;

  final Telephony telephony = Telephony.instance;

  String product_name, product_image;
  Text t1 = Text(
    "Charge per hour=500",
    style:
        TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
  );

  addQuery({
    Key? key,
    required this.product_name,
    required this.product_image,
  }) : super();
  //var _formKey = GlobalKey<FormState>();
  late DateTime _myDateTime;

  // String date = "Date";
  String takeDateTime = DateTime.now().toString().substring(0, 10);

  String _selectedTakeTime = "9.00 AM";
  String _selectedBackTime = "9.00 AM";
  String res = "";
  String result = "";
  String _selectedLocation = 'Kranti Chauk';
  String _selectedLocation2 = 'Cidco';
  List<String> _locations = [
    'Kranti Chauk',
    'Cidco',
    'Darga Road',
    'Central Bus Stand',
    'TV Center',
    'On Request'
  ];
  List<String> _locations1 = [
    'Kranti Chauk',
    'Cidco',
    'Darga Road',
    'Central Bus Stand',
    'TV Center',
    'On Request'
  ];

  TextEditingController nameControl = TextEditingController();
  TextEditingController emailControl = TextEditingController();
  TextEditingController phoneControl = TextEditingController();
  TextEditingController _howManyVehicles = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _takeTime = TextEditingController();
  TextEditingController _backTime = TextEditingController();
  TextEditingController _hours = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RentService rentService = RentService();
  var displayResult = " ";
  var _minimumPadding = 5.0;
  //int no=8888585093;
  // late DatabaseReference _ref;

  // void initState(){
  //   super.initState();
  //  _firebaseMessaging.

  // }

  @override
  Widget build(BuildContext context) {
    //for take time ----------------------------------------------------
    Future<void> _takeTimePicker(BuildContext context) async {
      final TimeOfDay? t =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (t != null) {
        setState(() {
          _selectedTakeTime = t.format(context);
        });
      }
    }

    //for take back ----------------------------------------------------
    Future<void> _backTimePicker(BuildContext context) async {
      final TimeOfDay? t =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (t != null) {
        setState(() {
          _selectedBackTime = t.format(context);
        });
      }
    }

    //for date-----------------------------------------------------------
    Future<void> _openDatePicker(BuildContext context) async {
      _myDateTime = (await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2022)))!;
      setState(() {
        //   final now = DateTime.now();
        takeDateTime = DateFormat("dd-MM-yy").format(_myDateTime);
        //   date = _myDateTime.toString();
      });
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          centerTitle: true,
          backgroundColor: Colors.pinkAccent.shade100,
          title: Text(
            "Follow your dream",
            style: TextStyle(
                color: Colors.black54,
                fontFamily: "Ephesis",
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(
                  left: _minimumPadding * 4,
                  right: _minimumPadding * 4,
                  bottom: _minimumPadding * 4),
              child: ListView(
                children: [
                  // Container(
                  //   color: Colors.greenAccent,
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     "lets go",
                  //     style: TextStyle(
                  //         fontSize: 40,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.redAccent),
                  //   ),
                  // ),
                  Container(
                    height: 150.0,
                    child: GridTile(
                      child: Container(child: Image.asset(this.product_image)),
                      footer: Container(
                        color: Colors.transparent,
                        // child: ListTile(
                        //   leading: Text(
                        //     this.product_name,
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.bold, fontSize: 20.0),
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Divider(
                    thickness: 5,
                    color: Colors.redAccent,
                  ),
                  Container(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextFormField(
                        //   style: textStyle,

                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'Please Enter Your Name';
                        //   }
                        // },
                        decoration: InputDecoration(
                            //  labelText: "Name",

                            enabled: false,
                            hintText: product_name,
                            hintStyle: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                                fontFamily: "times new roman"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),
                  ),

                  //how many hours-----------------------------------------------------------------
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 70, right: 70),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      //style: textStyle,

                      controller: _hours,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter hours';
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Enter Hours",
                          errorStyle: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 15.0,
                              fontFamily: "times new roman"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                  ),

                  Center(
                    child: Padding(
                        padding: const EdgeInsets.only(
                          top: 11.0,
                        ),
                        child: sort_charges()
                        // Text(
                        //   "Charge per hour=500",
                        //   style: TextStyle(
                        //       color: Colors.red,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 15),
                        // ),
                        ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, left: 0),
                      child: Text(
                        "Driver Charge per hour=150",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                  //   child: TextFormField(
                  //     enabled: false,
                  //     //style: textStyle,
                  //     controller: _hours,
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'Please Enter hours';
                  //       }
                  //     },
                  //     keyboardType: TextInputType.number,
                  //     decoration: InputDecoration(
                  //         labelText: "Hours",
                  //         hintText: "How many hours you want(Ex. 2)",
                  //         errorStyle: TextStyle(
                  //             color: Colors.redAccent,
                  //             fontSize: 15.0,
                  //             fontFamily: "times new roman"),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(5.0),
                  //         )),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0, right: 70),
                    child: ElevatedButton(
                        onPressed: () {
                          this.res = _calculateTotal();
                        },
                        child: Text("calculate Amount")),
                  ),

                  Center(
                      child: Text(
                    "Rs.${this.res} /-",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  )),

                  Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Select reporting office",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: new DropdownButton(
                            underline:
                                DropdownButtonHideUnderline(child: Container()),
                            value: _selectedLocation,
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                            onChanged: _myFunction,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: _locations.map((String location) {
                              return new DropdownMenuItem<String>(
                                  value: location, child: new Text(location));
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Select dropping Location",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: new DropdownButton(
                              underline: DropdownButtonHideUnderline(
                                  child: Container()),
                              value: _selectedLocation2,
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                              onChanged: _myFunction2,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: _locations1.map((String location1) {
                                return new DropdownMenuItem<String>(
                                    value: location1,
                                    child: new Text(location1));
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        //   style: textStyle,
                        controller: nameControl,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Name';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: "Name",
                            hintText: "Enter your name",
                            errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                                fontFamily: "times new roman"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                      //  style: textStyle,
                      controller: emailControl,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please Enter E-mail';
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your email",
                          errorStyle: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 15.0,
                              fontFamily: "times new roman"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      //style: textStyle,
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                      controller: phoneControl,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your phone number';
                        }
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: "Phone",
                          hintText: "Enter Your mobile number",
                          errorStyle: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 15.0,
                              fontFamily: "times new roman"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10.0),
                  //   child: TextFormField(
                  //     //style: textStyle,
                  //     style: TextStyle(
                  //         color: Colors.blue, fontWeight: FontWeight.bold),
                  //     controller: _howManyVehicles,
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'Please Enter how many vehicles';
                  //       }
                  //     },
                  //     keyboardType: TextInputType.number,
                  //     decoration: InputDecoration(
                  //         labelText: "Vehicles",
                  //         hintText: "how many vehicles",
                  //         errorStyle: TextStyle(
                  //             color: Colors.redAccent,
                  //             fontSize: 15.0,
                  //             fontFamily: "times new roman"),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(5.0),
                  //         )),
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, top: 8, bottom: 8),
                    child: TextFormField(
                      //   textAlign: TextAlign.center,
                      controller: _date,
                      decoration: InputDecoration(
                          //   hoverColor: Colors.red,
                          hintText: takeDateTime,
                          hintStyle: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          suffixIcon: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.redAccent.shade200)),
                              onPressed: () {
                                _openDatePicker(context);
                              },
                              child: Text("Pick Date"))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "which time you will take vehicles",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, top: 8, bottom: 8),
                    child: TextFormField(
                      //   textAlign: TextAlign.center,
                      controller: _takeTime,
                      decoration: InputDecoration(
                          //   hoverColor: Colors.red,
                          hintText: _selectedTakeTime,
                          hintStyle: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          suffixIcon: ElevatedButton(
                              onPressed: () {
                                _takeTimePicker(context);
                              },
                              child: Text("Pick Time"))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: 15.0, right: 15, top: 8, bottom: 8),
                  //   child: TextFormField(
                  //     //   textAlign: TextAlign.center,
                  //     controller: _takeTime,
                  //     decoration: InputDecoration(
                  //         //   hoverColor: Colors.red,
                  //         hintText: _selectedBackTime,
                  //         hintStyle: TextStyle(
                  //             color: Colors.blueAccent,
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.bold),
                  //         suffixIcon: ElevatedButton(
                  //             onPressed: () {
                  //               _backTimePicker(context);
                  //             },
                  //             child: Text("Pick Time"))),
                  //   ),
                  // ),

                  SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   "NOTE :If you do not return on time, you will have to pay more.\nSuppose\nOne hour late = 300,\nTwo hours late = 500,\nThree hours late = 1000 ",
                  //   style: TextStyle(color: Colors.red),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: RaisedButton(
                      onPressed: () {
                        // setState(() {
                        validateAndUpload();

                        //    _sentSMS();
                        //   _sentDetails();
                        //  _sendFinalMessage();

                        //  return setSMS();
                        // saveHere();
                        // if (_formKey.currentState!.validate()) {
                        //   this.displayResult = _getInfo();
                        // }

                        //  });
                      },
                      autofocus: false,
                      color: Theme.of(context).accentColor,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        "Proceed To Book",
                        style: TextStyle(
                            fontFamily: "times new roman", color: Colors.white),
                        textScaleFactor: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  String _getInfo() {
    String result = "Query Successfully Submitted";
    return result;
  }

  void validateAndUpload() async {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TermsAndCondition(
                    productName: product_name,
                    hours: _hours.text,
                    totalAmount: res,
                    repLocation: _selectedLocation,
                    dropLocation: _selectedLocation2,
                    name: nameControl.text,
                    email: emailControl.text,
                    phone: phoneControl.text,
                    date: _date.text,
                    pickTime: _selectedTakeTime,
                  )));
    }
  }

  _sentSMS() async {
    await telephony.sendSms(
        to: phoneControl.text,
        message:
            "Congratulation Mr/Ms ${nameControl.text} your ${product_name.toUpperCase()} is confirm successfully.\nThank you");
  }

  _sentDetails() async {
    await telephony.sendSms(
        to: phoneControl.text,
        message:
            "Vehicle Details :\nDate : ${takeDateTime.toString()}\nTaken Timing :${_selectedTakeTime}\nCurrent Amount : ${res} /-\nSelected Location : ${_selectedLocation}");
  }

  void _sendFinalMessage() async {
    await telephony.sendSms(
        to: phoneControl.text,
        message:
            "Please Report On Selected Location :${_selectedLocation} With Same Time");
  }

  String _calculateTotal() {
    setState(() {
      int hour = int.parse(_hours.text);
      int total = (hour * 500) + (hour * 150);
      result = "$total";
    });
    return result;
  }

  void _myFunction(String? value) {
    setState(() {
      _selectedLocation = value.toString();
    });
  }

  void _myFunction2(String? value1) {
    setState(() {
      _selectedLocation2 = value1.toString();
    });
  }

  Widget sort_charges() {
    if (widget.product_categories == "Cars") {
      t1 = Text(
        "Charge per hour=500",
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
      );
    } else if (widget.product_categories == "Two Weelers") {
      t1 = Text(
        "Charge per hour=200",
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
      );
    } else if (widget.product_categories == "Buses") {
      t1 = Text(
        "Charge per hour=1500",
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
      );
    } else {
      t1 = Text(
        "Charge per hour=1100",
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
      );
    }
    return t1;
  }
}
