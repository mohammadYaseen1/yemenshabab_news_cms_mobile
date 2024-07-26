import 'package:flutter/material.dart';
import 'package:ribbon_widget/ribbon_widget.dart';

class BannerBasicPage extends StatelessWidget {
  final RibbonLocation location;
  final Widget widget;
  final String title;
  final double? fontSize;
  final Color? color;

  const BannerBasicPage({
    super.key,
    this.location = RibbonLocation.topStart,
    required this.widget,
    required this.title,
    this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Ribbon(
        nearLength: 90,
        farLength: 40,
        title: title,
        titleStyle: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold),
        color: color ?? Theme.of(context).colorScheme.primary,
        location: location,
        child: widget,
      ));
}
