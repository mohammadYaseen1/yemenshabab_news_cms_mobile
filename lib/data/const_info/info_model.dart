class InfoModel {
  final String header;
  final String? description;
  final List<DataModel> dataModel;

  InfoModel({
    required this.header,
    required this.dataModel,
    this.description,
  });
}

class DataModel {
  final String header;
  final String? description;
  final LinkData? link;
  final List<DataList> dataList;
  final List<DataModel> nested;

  DataModel({
    required this.header,
    this.description,
    this.link,
    this.dataList = const [],
    this.nested = const [],
  });
}

class DataList {
  final String header;
  final String description;

  DataList({
    required this.header,
    required this.description,
  });
}

class LinkData {
  final String title;
  final String url;

  LinkData({
    required this.title,
    required this.url,
  });
}
