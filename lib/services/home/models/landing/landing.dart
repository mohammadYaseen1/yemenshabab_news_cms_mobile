import 'layout.dart';

/// layouts : [{"uuid":"1","main":{"uuid":"1","name":"L_1B","dataType":"NEWS","sectionId":"1","color":"rgba(179,239,245,0.81)","categories":["World","Sports"],"items":[{"title":"Breaking News","subtitle":"","category":"World","date":"2024-05-26","image":"https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","video":"","description":"Urgent update regarding the latest events in the region, more details will be available soon.","shortDescription":"","categoryColor":"rgb(128, 0, 128)"}],"header":""},"side":{},"type":"TWO","order":"1","creationDate":"2024-05-26","createdBy":"super"}]
/// totalRecords : "16"

class Landing {
  Landing({
    List<LayoutData>? layouts,
    String? totalRecords,
  }) {
    _layouts = layouts;
    _totalRecords = totalRecords;
  }

  Landing.fromJson(dynamic json) {
    if (json['layouts'] != null) {
      _layouts = [];
      json['layouts'].forEach((v) {
        _layouts?.add(LayoutData.fromJson(v));
      });
    }
    _totalRecords = json['totalRecords'];
  }

  List<LayoutData>? _layouts;
  String? _totalRecords;

  List<LayoutData>? get layouts => _layouts;

  String? get totalRecords => _totalRecords;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_layouts != null) {
      map['layouts'] = _layouts?.map((v) => v.toJson()).toList();
    }
    map['totalRecords'] = _totalRecords;
    return map;
  }
}
