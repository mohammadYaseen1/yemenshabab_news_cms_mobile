import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key, required this.onChanged, required this.fontSize})
      : super(key: key);

  final ValueChanged<double> onChanged;
  final double fontSize;

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  late double fontSize;

  @override
  void initState() {
    super.initState();
    fontSize = widget.fontSize;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: fontSize,
      max: 24.0,
      min: 10.0,
      onChanged: (value) {
        widget.onChanged(value);
        setState(() {
          fontSize = value;
        });
      },
    );
  }
}
