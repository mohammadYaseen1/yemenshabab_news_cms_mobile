import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "emptyMyList".tr,
        style: const TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}
