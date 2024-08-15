/// title : "Breaking News"
/// subtitle : ""
/// category : "World"
/// date : "2024-05-26"
/// image : "https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
/// video : ""
/// description : "Urgent update regarding the latest events in the region, more details will be available soon."
/// shortDescription : ""
/// categoryColor : "rgb(128, 0, 128)"
library;

class Item {
  Item({
    String? title,
    String? subtitle,
    String? category,
    String? categoryEn,
    String? date,
    String? image,
    String? video,
    String? description,
    String? shortDescription,
    String? categoryColor,
    String? uuid,
  }) {
    _title = title;
    _subtitle = subtitle;
    _category = category;
    _categoryEn = categoryEn;
    _date = date;
    _image = image;
    _video = video;
    _description = description;
    _shortDescription = shortDescription;
    _categoryColor = categoryColor;
    _uuid = uuid;
  }

  Item.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _title = json['title'];
    _subtitle = json['subtitle'];
    _category = json['category'];
    _categoryEn = json['categoryEn'];
    _date = json['date'];
    _image = json['image'];
    _video = json['video'];
    _description = json['description'];
    _shortDescription = json['shortDescription'];
    _categoryColor = json['categoryColor'];
  }

  String? _uuid;
  String? _title;
  String? _subtitle;
  String? _category;
  String? _categoryEn;
  String? _date;
  String? _image;
  String? _video;
  String? _description;
  String? _shortDescription;
  String? _categoryColor;

  String? get title => _title;

  String? get subtitle => _subtitle;

  String? get category => _category;

  String? get categoryEn => _categoryEn;

  String? get date => _date;

  String? get image => _image;

  String? get video => _video;

  String? get description => _description;

  String? get shortDescription => _shortDescription;

  String? get categoryColor => _categoryColor;

  String? get uuid => _uuid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['title'] = _title;
    map['subtitle'] = _subtitle;
    map['category'] = _category;
    map['date'] = _date;
    map['image'] = _image;
    map['video'] = _video;
    map['description'] = _description;
    map['shortDescription'] = _shortDescription;
    map['categoryColor'] = _categoryColor;
    return map;
  }

  @override
  String toString() {
    return """
                title: $title,
                subtitle: $subtitle,
                category: $category,
                categoryEn: $categoryEn,
                date: $date,
                image: $image,
                video: $video,
                description: $description,
                shortDescription: $shortDescription,
                categoryColor: $categoryColor,
                uuid: $uuid,
    """;
  }
}
