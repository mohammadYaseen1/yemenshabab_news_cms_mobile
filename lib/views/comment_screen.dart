import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({Key? key, required this.uuid}) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text(uuid),
        ),
      ),
    );
  }
}
