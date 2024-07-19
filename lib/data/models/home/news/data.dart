import 'dart:ui';

import 'package:yemenshabab_news_cms_mobile/services/home/models/news/news_entity.dart';

class DataModel {
  DataModel({
    String? uuid,
    String? image,
    String? title,
    String? subTitle,
    String? time,
    String? tag,
    Color? color,
    String? dataType
  }) {
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
  String? _dataType;

  String? get image => _image;

  String? get title => _title;

  String? get subTitle => _subTitle;

  String? get time => _time;

  String? get tag => _tag;

  Color? get color => _color;

  String? get uuid => _uuid;

  String? get dataType => _dataType;
}
