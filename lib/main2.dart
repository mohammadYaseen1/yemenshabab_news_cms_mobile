// import 'package:connectivity_plus_widget/connectivity/connectivity_plus_service.dart';
// import 'package:connectivity_plus_widget/connectivity/connectivity_widget.dart';
// import 'package:flutter/material.dart';
// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   ConnectivityPlusService().initConnectivityService();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Connectivity Plus Widget Example',
//       home: Screen1(),
//     );
//   }
// }
//
// class Screen1 extends StatelessWidget {
//   const Screen1({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: Column(
//             children: [
//               ConnectivityPlusWidget(
//                 backgroundColor: Colors.red,
//                 height: 40,
//                 marquee: false,
//                 textStyle: const TextStyle(fontSize: 20, color: Colors.white),
//               ),
//               const Spacer(),
//               ConnectivityPlusWidget(
//                 width: 300,
//                 backgroundColor: Colors.grey,
//                 textStyle: const TextStyle(fontSize: 20),
//               ),
//               const Spacer(),
//               ConnectivityPlusWidget(
//                 backgroundColor: Colors.orange,
//                 height: 100,
//                 notConnectedText: "Custom Text",
//                 marquee: true,
//                 textStyle: const TextStyle(fontSize: 30, color: Colors.white),
//                 decoration: BoxDecoration(
//                   color: Colors.blueAccent,
//                   border: Border.all(
//                     width: 10,
//                     color: Colors.red,
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               ConnectivityPlusCustomWidget(
//                 customWidget: Center(
//                   child: Container(
//                     child: const Center(child: Text("Custom Widget ")),
//                     height: 100,
//                     width: 300,
//                     decoration: BoxDecoration(
//                       color: Colors.greenAccent,
//                       border: Border.all(
//                         width: 10,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               CupertinoButton(
//                   child: const Text("Click here to check internet status"),
//                   onPressed: () {
//                     log(ConnectivityPlusService().getInternetStatus().toString(),
//                         name: "status");
//                   }),
//               Container(
//                 margin: const EdgeInsets.all(20),
//                 child: ConnectivityPlusWidget(
//                   notConnectedText: "No Internet",
//                   marquee: false,
//                   padding: const EdgeInsets.all(10),
//                   backgroundColor: Colors.orange,
//                   height: 50,
//                   textStyle: const TextStyle(fontSize: 20, color: Colors.red),
//                   decoration: new BoxDecoration(
//                     color: Colors.amberAccent, //new Color.fromRGBO(255, 0, 0, 0.0),
//                     borderRadius: new BorderRadius.all(
//                       const Radius.circular(40.0),
//                     ),
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               ConnectivityPlusCustomWidget(
//                 customWidget: const Center(
//                   child: Icon(
//                     Icons.wifi_off_outlined,
//                     color: Colors.red,
//                     size: 100,
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               ConnectivityPlusWidget(
//                 backgroundColor: Colors.orange,
//                 height: 40,
//                 marquee: true,
//                 textStyle: const TextStyle(fontSize: 20, color: Colors.white),
//                 decoration: BoxDecoration(
//                     color: Colors.orange, //new Color.fromRGBO(255, 0, 0, 0.0),
//                     borderRadius: new BorderRadius.only(
//                         topLeft: const Radius.circular(20.0),
//                         topRight: const Radius.circular(20.0))),
//               ),
//               ConnectivityPlusWidget(
//                 backgroundColor: Colors.red,
//                 height: 40,
//                 marquee: true,
//                 textStyle: const TextStyle(fontSize: 20, color: Colors.white),
//               ),
//             ],
//           )),
//     );
//   }
// }
