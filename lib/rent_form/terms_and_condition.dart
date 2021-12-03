import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rentify_all/pages/order_submit.dart';
import 'package:rentify_all/rent_form/rent_event.dart';
import 'package:telephony/telephony.dart';

class TermsAndCondition extends StatefulWidget {
  final String productName,
      hours,
      totalAmount,
      repLocation,
      dropLocation,
      name,
      email,
      phone,
      date,
      pickTime;
  const TermsAndCondition(
      {Key? key,
      required this.productName,
      required this.hours,
      required this.totalAmount,
      required this.repLocation,
      required this.dropLocation,
      required this.name,
      required this.email,
      required this.phone,
      required this.date,
      required this.pickTime})
      : super(
          key: key,
        );

  @override
  _TermsAndConditionState createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  final Telephony telephony = Telephony.instance;
  RentService rentService = RentService();
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms and conditions"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              height: 300,
              child: Card(
                elevation: 50,
                shadowColor: Colors.transparent,
                color: Colors.black12,
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "1)  Calculated amount will not be negotiated\n\n2) amount will be depending on your hourly use of vehicle so it can increase as per your use\n\n3) charges cannot transferable to any other vehicle.\n\n4) You need to pay 50 % of amount at the time of Pickup at our office location\n\n5) You have to submit your copy of government ID proof at our Office",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    CheckboxListTile(
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue!;
                        });
                      },
                      tileColor: Colors.greenAccent,
                      title: Text(
                        "I Agree",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              height: 250,
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black)),
                elevation: 50,
                shadowColor: Colors.transparent,
                color: Colors.blue.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "By clicking on the “I ACCEPT” button or by using Rentify’s services, You are consenting to be bound by these User Terms. PLEASE ENSURE THAT YOU READ AND UNDERSTAND ALL THESE USER TERMS BEFORE YOU USE THE SITE. If You do not accept any of the User Terms, then please do not use the Site or avail any of the services being provided therein. YOUR AGREEMENT TO THESE USER TERMS SHALL OPERATE AS A BINDING AGREEMENT BETWEEN YOU AND RENTIFY IN RESPECT OF THE USE AND SERVICES OF THE COMPANY.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
          ),
          checkedValue
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        _sentSMS();
                        _sentDetails();
                        _sendFinalMessage();
                        validateAndUpload();
                      },
                      child: Text("Book Now")),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Please Select Above CheckBox To Agree",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  void validateAndUpload() async {
    rentService.uploadProduct(
        name: widget.name,
        email: widget.email,
        phone: widget.phone,
        //  vehicles: _howManyVehicles.text,
        date: widget.date,
        takeTime: widget.pickTime,
        // backTime: _selectedBackTime,
        hours: widget.hours,
        vehicleName: widget.hours,
        totalAmount: widget.totalAmount,
        repOffice: widget.repLocation,
        dropLocation: widget.dropLocation);

    Fluttertoast.showToast(msg: "Your Order is Successful");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OrderSubmit()));
  }

  _sentSMS() async {
    await telephony.sendSms(
        to: widget.phone,
        message:
            "Congratulation Mr/Ms ${widget.name} your ${widget.productName} is confirm successfully.\nThank you");
  }

  _sentDetails() async {
    await telephony.sendSms(
        to: widget.phone,
        message:
            "Vehicle Details :\nDate : ${widget.date}\nTaken Timing :${widget.pickTime}\nCurrent Amount : ${widget.totalAmount} /-\nSelected Location : ${widget.repLocation}");
  }

  void _sendFinalMessage() async {
    await telephony.sendSms(
        to: widget.phone,
        message:
            "Please Report On Selected Location :${widget.dropLocation} With Same Time");
  }
}
