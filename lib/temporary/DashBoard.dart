import 'package:flutter/material.dart';
import 'package:rentify_all/temporary/AdminInfo.dart';
import 'package:rentify_all/temporary/DatabaseManager.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List userProfileList = [];
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUserList();
    if (resultant == null) {
      print("Unable to retrive data");
    } else {
      setState(() {
        userProfileList = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.pinkAccent.shade100,
        title: Text("Admin"),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 35.0, left: 30, right: 30),
              child: Text(
                "Total users : ${userProfileList.length}",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
      body: Container(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminInfo(
                              vehicleName: userProfileList[index]
                                  ['1.vehicle name'],
                              name: userProfileList[index]['2.name'],
                              email: userProfileList[index]['4.email'],
                              phone: userProfileList[index]['5.phone'],
                              date: userProfileList[index]['7.date'],
                              startTime: userProfileList[index]['8.takeTime'],
                              bookedHours: userProfileList[index]['9.1.hours'],
                              totalAmount: userProfileList[index]
                                  ['9.2.Total Amount'],
                              repOffice: userProfileList[index]
                                  ['9.3 Reporting Office'],
                              dropOffice: userProfileList[index]
                                  ['9.4 Droping Location'],
                            )));
              },
              title: Text("${userProfileList[index]['2.name']}"),
              subtitle: Text("${userProfileList[index]['4.email']}"),
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              trailing: Text("${userProfileList[index]['9.2.Total Amount']}"),
            ),
          );
        },
        itemCount: userProfileList.length,
      )),
    );
  }
}
