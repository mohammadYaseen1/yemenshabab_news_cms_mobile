import 'dart:ui';

import 'package:flutter/animation.dart';

class IndicatorModel {
  IndicatorModel({
    String? image,
    String? tag,
    String? title,
    String? time,
    String? source,
    Color? color,
    String? uuid,
    String? dataType,
  }) {
    _image = image;
    _tag = tag;
    _title = title;
    _time = time;
    _source = source;
    _color = color;
    _uuid = uuid;
    _dataType = dataType;
  }

  String? _image;
  String? _tag;
  String? _title;
  String? _time;
  String? _source;
  Color? _color;
  String? _uuid;
  String? _dataType;

  String? get image => _image;

  String? get tag => _tag;

  String? get title => _title;

  String? get time => _time;

  String? get source => _source;

  Color? get color => _color;

  String? get uuid => _uuid;

  String? get dataType => _dataType;
}
