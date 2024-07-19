import 'package:yemenshabab_news_cms_mobile/data/models/home/news/news_type.dart';

import 'data.dart';

class NewsModel {
  NewsModel({
    String? title,
    String? name,
    ViewType? type,
    List<DataModel>? data,
  }) {
    _title = title;
    _name = name;
    _type = type;
    _data = data;
  }

  String? _title;
  String? _name;
  ViewType? _type;
  List<DataModel>? _data;

  String? get title => _title;

  String? get name => _name;

  ViewType? get type => _type;

  List<DataModel>? get data => _data;
}
