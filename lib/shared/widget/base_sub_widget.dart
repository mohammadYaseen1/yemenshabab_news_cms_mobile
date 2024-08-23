import 'package:flutter/material.dart';

class BaseSubWidget extends StatelessWidget {
  final Widget body;
  final String title;
  const BaseSubWidget({
    super.key,
    required this.body,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: body,
    );
  }
}
