import 'package:flutter/material.dart';
import 'package:ribbon_widget/ribbon_widget.dart';

class BannerBasicPage extends StatelessWidget {
  final RibbonLocation location;
  final Widget widget;
  final String title;
  final double? fontSize;

  const BannerBasicPage({
    super.key,
    this.location = RibbonLocation.topStart,
    required this.widget,
    required this.title, this.fontSize,
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Ribbon(
        nearLength: 70,
        farLength: 40,
        title: title,
        titleStyle: TextStyle(color: Colors.white, fontSize: fontSize,fontWeight: FontWeight.bold),
        color: Theme.of(context).colorScheme.primary,
        location: location,
        child: widget,
      ));
}
