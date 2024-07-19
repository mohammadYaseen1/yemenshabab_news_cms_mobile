import 'package:flutter/material.dart';

class DefaultOutlinedButton extends StatelessWidget {
  const DefaultOutlinedButton({
    required this.onPressed,
    required this.child,
    this.elevation,
    this.backgroundColor = Colors.transparent,
    this.width = double.infinity,
    this.height = 60,
    this.colorSide = Colors.black,
    this.radius = 0,
    this.duration,
    this.overlayColor,
    this.borderSide,
    Key? key,
  }) : super(key: key);

  final Function() onPressed;
  final Widget child;
  final double? elevation;
  final Color backgroundColor;
  final double width;
  final double height;
  final Color colorSide;
  final double radius;
  final Duration? duration;
  final Color? overlayColor;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        fixedSize: MaterialStateProperty.all(Size(width, height)),
        side: MaterialStateProperty.all(borderSide ??
            BorderSide(
              width: 2.0,
              color: colorSide,
            )),
        animationDuration: duration,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        overlayColor: MaterialStateProperty.all(overlayColor),
      ),
    );
  }
}
