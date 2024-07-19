import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadJsonData() async {
  String jsonData = await rootBundle.loadString('assets/data.json');
  return jsonData;
}

void parseJsonData() async {
  String jsonData = await loadJsonData();
  Map<String, dynamic> data = json.decode(jsonData);

  // Access the data as needed
  print(data['key']);
}

Route createRoute(Widget Function() page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
