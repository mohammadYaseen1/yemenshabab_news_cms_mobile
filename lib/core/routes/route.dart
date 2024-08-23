class Route {
  Route._privateConstructor();

  static final Route _instance = Route._privateConstructor();

  static String host = "http://localhost:8080";
  static String baseUrl = "/api/v1/main";

  factory Route() {
    return _instance;
  }

  static Route get instance {
    return _instance;
  }
}

class RouteConstant {
  static const String _news = "news";
  static const String _programs = "programs";
  static const String _settings = "settings";
  static const String _programsSchedule = "programs-schedule";
  static const String _section = "section";
  static const String _category = "category";
  static const String _article = "article";
  static const String _writer = "writer";
  static const String _breakingNews = "breaking-news";
  static const String _programGroup = "program-group";

  static String get news => _news;

  static String get programs => _programs;

  static String get settings => _settings;

  static String get programsSchedule => _programsSchedule;

  static String get section => _section;

  static String get category => _category;

  static String get article => _article;

  static String get writer => _writer;

  static String get breakingNews => _breakingNews;

  static String get programGroup => _programGroup;
}

abstract class Route2 {
  String baseUrl();
}
