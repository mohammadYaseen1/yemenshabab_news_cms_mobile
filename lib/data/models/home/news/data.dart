import 'dart:ui';

import 'package:yemenshabab/data/models/home/news/news_type.dart';

class DataModel {
  DataModel(
      {String? uuid,
      String? image,
      String? title,
      String? subTitle,
      String? time,
      String? tag,
      Color? color,
      ViewType? dataType}) {
    _image = image;
    _subTitle = subTitle;
    _title = title;
    _time = time;
    _tag = tag;
    _color = color;
    _uuid = uuid;
    _dataType = dataType;
  }

  String? _image;
  String? _title;
  String? _subTitle;
  String? _time;
  String? _tag;
  Color? _color;
  String? _uuid;
  ViewType? _dataType;

  String? get image => _image;

  String? get title => _title;

  String? get subTitle => _subTitle;

  String? get time => _time;

  String? get tag => _tag;

  Color? get color => _color;

  String? get uuid => _uuid;

  ViewType? get dataType => _dataType;
}
