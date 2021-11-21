// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class HorizontalList extends StatelessWidget {
//   const HorizontalList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white30,
//       height: 80,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: <Widget>[
//           //  Vertical_devider(),
//           Category(
//             image_location: "images/cars/rent_cars/bmwx1.jpeg",
//             image_caption: "Cars",
//           ),
//           //  Vertical_devider(),
//           Category(
//             image_location: "images/rent_bikes/hondasp125.jpg",
//             image_caption: "Bikes",
//           ),
//           // Vertical_devider(),
//           Category(
//             image_location: "images/rent_cycle/herolectro.jpg",
//             image_caption: "Bi-Cycles",
//           ),
//           // Vertical_devider(),
//           Category(
//             image_location: "images/cars/camera.jpg",
//             image_caption: "Cameras",
//           ),
//           //  Vertical_devider(),
//         ],
//       ),
//     );
//   }

// //   Vertical_devider() {
// //     return Padding(
// //       padding: const EdgeInsets.only(top: 20, bottom: 20),
// //       child: VerticalDivider(
// //         color: Colors.red,
// //         thickness: 4,
// //       ),
// //     );
// //   }
// }

// class Category extends StatelessWidget {
//   // const Category({Key? key}) : super(key: key);

//   late final String image_location;
//   late final String image_caption;

//   Category({required this.image_caption, required this.image_location});

//   @override
//   Widget build(BuildContext context) {
//     // return Padding(
//     //   padding: EdgeInsets.only(left: 0.4, right: 0.4),
//     //   child: InkWell(
//     //       onTap: () {},
//     //       child: Container(
//     //         width: 90,

//     //         // height: 300,
//     //         //   color: Colors.lightBlueAccent,
//     //         child: ListTile(
//     //           title: CircleAvatar(
//     //             radius: 40,
//     //             backgroundColor: Colors.white,
//     //             child: ClipRRect(
//     //               borderRadius: BorderRadius.circular(200),
//     //               child: Image.asset(image_location),
//     //             ),
//     //             // child: Image.asset(
//     //             //   image_location,
//     //             //   width: 60,
//     //             //   height: 30,
//     //             // ),
//     //           ),
//     //           subtitle: Container(
//     //             //color: Colors.yellow,

//     //             alignment: Alignment.topCenter,
//     //             child: Text(
//     //               image_caption,
//     //               style: TextStyle(
//     //                 color: Colors.black,
//     //                 fontFamily: "times new roman",
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //       )),
//     // );

//     return Padding(
//       padding: EdgeInsets.only(left: 0.9, right: 0.9),
//       child: InkWell(
//           onTap: () {},
//           child: Container(
//             width: 100,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(width: 2, color: Colors.blueAccent)),

//             // height: 300,
//             //   color: Colors.lightBlueAccent,
//             child: ListTile(
//               title: Image.asset(
//                 image_location,
//                 width: 100,
//                 height: 80,
//               ),
//               subtitle: Container(
//                 //color: Colors.yellow,
//                 alignment: Alignment.topCenter,
//                 child: Text(
//                   image_caption,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontFamily: "times new roman",
//                   ),
//                 ),
//               ),
//             ),
//           )),
//     );
//   }
// }
