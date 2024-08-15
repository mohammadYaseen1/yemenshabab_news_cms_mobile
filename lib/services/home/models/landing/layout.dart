import 'package:yemenshabab/services/home/models/landing/data.dart';

/// uuid : "1"
/// main : {"uuid":"1","name":"L_1B","dataType":"NEWS","sectionId":"1","color":"rgba(179,239,245,0.81)","categories":["World","Sports"],"items":[{"title":"Breaking News","subtitle":"","category":"World","date":"2024-05-26","image":"https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","video":"","description":"Urgent update regarding the latest events in the region, more details will be available soon.","shortDescription":"","categoryColor":"rgb(128, 0, 128)"}],"header":""}
/// side : {"uuid":"1","name":"L_1B","dataType":"NEWS","sectionId":"1","color":"rgba(179,239,245,0.81)","categories":["World","Sports"],"items":[{"title":"Breaking News","subtitle":"","category":"World","date":"2024-05-26","image":"https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","video":"","description":"Urgent update regarding the latest events in the region, more details will be available soon.","shortDescription":"","categoryColor":"rgb(128, 0, 128)"}],"header":""}
/// type : "TWO"
/// order : "1"
/// creationDate : "2024-05-26"
/// createdBy : "super"

class LayoutData {
  LayoutData({
    String? uuid,
    Data? main,
    Data? side,
    String? type,
    String? order,
    String? creationDate,
    String? createdBy,
  }) {
    _uuid = uuid;
    _main = main;
    _side = side;
    _type = type;
    _order = order;
    _creationDate = creationDate;
    _createdBy = createdBy;
  }

  LayoutData.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _main = json['main'] != null ? Data.fromJson(json['main']) : null;
    _side = json['side'] != null ? Data.fromJson(json['side']) : null;
    _type = json['type'];
    _order = json['order'];
    _creationDate = json['creationDate'];
    _createdBy = json['createdBy'];
  }

  String? _uuid;
  Data? _main;
  Data? _side;
  String? _type;
  String? _order;
  String? _creationDate;
  String? _createdBy;

  String? get uuid => _uuid;

  Data? get main => _main;

  Data? get side => _side;

  String get type => _type ?? "";

  set type(String value) {
    _type = value;
  }

  String? get order => _order;

  String? get creationDate => _creationDate;

  String? get createdBy => _createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    if (_main != null) {
      map['main'] = _main?.toJson();
    }
    if (_side != null) {
      map['side'] = _side;
    }
    map['type'] = _type;
    map['order'] = _order;
    map['creationDate'] = _creationDate;
    map['createdBy'] = _createdBy;
    return map;
  }

  @override
  String toString() {
    return order!;
  }
}
