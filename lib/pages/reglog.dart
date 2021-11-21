// import 'package:flutter/material.dart';

// import 'home.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         color: Colors.lightGreenAccent,
//         home: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.blue,
//             title: const Text(
//               'Login/Register',
//               style: TextStyle(fontFamily: "times new roman"),
//             ),
//           ),
//           body: Builder(
//               builder: (context) => Container(
//                     height: 1000,
//                     width: 500,
//                     decoration: const BoxDecoration(
//                         //       image: DecorationImage(image: AssetImage("images/back.jpg"),
//                         //           fit: BoxFit.cover
//                         //       )
//                         ),
//                     child: ListView(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               right: 10.0, left: 10.0, top: 100),
//                           child: Image.asset(
//                             "images/letsgo.png",
//                             width: 150,
//                             height: 150,
//                           ),
//                         ),
//                         Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 20, right: 20, top: 40),
//                             child: RaisedButton(
//                               onPressed: () {
//                                 Navigator.push(context,
//                                     MaterialPageRoute(builder: (context) {
//                                   return HomePage();
//                                 }));
//                               },
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0)),
//                               elevation: 5,
//                               color: Colors.redAccent,
//                               //color: Colors.lightBlueAccent,
//                               child: const Text(
//                                 "LOGIN",
//                                 style: TextStyle(
//                                     fontFamily: "times new roman",
//                                     fontSize: 30,
//                                     color: Colors.deepPurple),
//                               ),
//                             )),
//                         Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 20, right: 20, top: 15),
//                             child: RaisedButton(
//                               onPressed: () {
//                                 //   Navigator.push(context, MaterialPageRoute(builder: (context){
//                                 //  //   return register();
//                                 //   }));
//                               },
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10.0)),
//                               elevation: 5,
//                               color: Colors.lightBlueAccent,
//                               child: const Text(
//                                 "REGISTER",
//                                 style: TextStyle(
//                                     fontFamily: "times new roman",
//                                     fontSize: 30,
//                                     color: Colors.white),
//                               ),
//                             ))
//                       ],
//                     ),
//                   )),
//         ));
//   }
// }
