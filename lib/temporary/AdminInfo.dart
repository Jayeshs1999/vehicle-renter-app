import 'package:flutter/material.dart';
import 'package:rentify_all/temporary/DatabaseManager.dart';

class AdminInfo extends StatelessWidget {
  TextStyle style = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black45);
  TextStyle style1 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black);

  // var selectedDriver = "Sumit Patil";
  // List<String> _locations1 = [
  //   'Rakesh Chaure',
  //   'Sumit Patil',
  //   'Sanket Ghodke',
  //   'Swapnil Jadhav',
  //   'Prabhanjan joshi',
  //   'Rutik '
  // ];
  final String name,
      email,
      phone,
      vehicleName,
      date,
      startTime,
      bookedHours,
      totalAmount,
      repOffice,
      dropOffice;
  AdminInfo(
      {Key? key,
      required this.name,
      required this.email,
      required this.phone,
      required this.vehicleName,
      required this.startTime,
      required this.date,
      required this.bookedHours,
      required this.totalAmount,
      required this.repOffice,
      required this.dropOffice})
      : super(key: key);

  List userProfileList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.pinkAccent.shade100,
        title: Text("Admin"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
              ),
            ),
            Text("- User Details -", style: style1),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 11),
              child: Container(
                height: 500,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Name        :", style: style),
                        Text(
                          " ${this.name}",
                          style: style,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("Email ID    :", style: style),
                        Text("  ${this.email}", style: style)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Phone No :", style: style),
                        Text("  ${this.phone}", style: style)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Divider(
                        thickness: 2,
                        color: Colors.red,
                      ),
                    ),
                    Text("Order details\n\t", style: style1),
                    Row(
                      children: [
                        Text("Vehicle Name           :", style: style),
                        Text("  ${this.vehicleName}", style: style)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Date                            :", style: style),
                        Text("  ${this.date}", style: style)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Start Time                 :", style: style),
                        Text("  ${this.startTime}", style: style)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Booked Hours           :", style: style),
                        Text("  ${this.bookedHours}", style: style)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Total Amount            :", style: style),
                        Text("  ${this.totalAmount} /-", style: style)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Reporting Office       :", style: style),
                        Text("  ${this.repOffice}", style: style)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Drop Office                :", style: style),
                        Text("  ${this.dropOffice}", style: style)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
