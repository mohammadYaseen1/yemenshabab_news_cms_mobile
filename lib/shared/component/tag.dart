import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({
    super.key,
    required this.tagName,
    this.color = Colors.white,
    this.tagColor,
    this.width = 100,
    this.height = 40,
    this.opacity = 0.15,
  });

  final String tagName;
  final Color color;
  final Color? tagColor;
  final double width;
  final double height;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color.withOpacity(opacity),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          tagName,
          style: TextStyle(
            color: tagColor ?? color,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
