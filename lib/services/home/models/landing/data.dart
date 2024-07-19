import 'item.dart';

/// uuid : "1"
/// name : "L_1B"
/// dataType : "NEWS"
/// sectionId : "1"
/// color : "rgba(179,239,245,0.81)"
/// categories : ["World","Sports"]
/// items : [{"title":"Breaking News","subtitle":"","category":"World","date":"2024-05-26","image":"https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","video":"","description":"Urgent update regarding the latest events in the region, more details will be available soon.","shortDescription":"","categoryColor":"rgb(128, 0, 128)"}]
/// header : ""

class Data {
  Data({
    String? uuid,
    String? name,
    String? dataType,
    String? sectionId,
    String? color,
    List<String>? categories,
    List<Item>? items,
    String? header,
    String? headerAr,
  }) {
    _uuid = uuid;
    _name = name;
    _dataType = dataType;
    _sectionId = sectionId;
    _color = color;
    _categories = categories;
    _items = items;
    _header = header;
    _headerAr = headerAr;
  }

  Data.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _name = json['name'];
    _dataType = json['dataType'];
    _sectionId = json['sectionId'];
    _color = json['color'];
    _categories =
    json['categories'] != null ? json['categories'].cast<String>() : [];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Item.fromJson(v));
      });
    }
    _header = json['header'];
    _headerAr = json['headerAr'];
  }

  String? _uuid;
  String? _name;
  String? _dataType;
  String? _sectionId;
  String? _color;
  List<String>? _categories;
  List<Item>? _items;
  String? _header;
  String? _headerAr;

  String? get uuid => _uuid;

  String? get name => _name;

  String? get dataType => _dataType;

  String? get sectionId => _sectionId;

  String? get color => _color;

  List<String>? get categories => _categories;

  List<Item>? get items => _items;

  String? get header => _header;

  String? get headerAr => _headerAr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['name'] = _name;
    map['dataType'] = _dataType;
    map['sectionId'] = _sectionId;
    map['color'] = _color;
    map['categories'] = _categories;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['header'] = _header;
    map['headerAr'] = _headerAr;
    return map;
  }

  @override
  String toString() {
    return """
uuid: $uuid,
name: $name,
dataType: $dataType,
sectionId: $sectionId,
color: $color,
categories: $categories,
items: $items,
header: $header,
headerAr: $headerAr,
    """;
  }
}
