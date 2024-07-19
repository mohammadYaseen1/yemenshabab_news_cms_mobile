enum ViewType {
  NEWS,
  STORY,
  VIDEO,
  PROGRAM,
  ARTICLE;

  static ViewType valueOf(String type) => switch (type) {
        "NEWS" => ViewType.NEWS,
        "STORY" => ViewType.STORY,
        "VIDEO" => ViewType.VIDEO,
        "ARTICLE" => ViewType.ARTICLE,
        "PROGRAM" => ViewType.PROGRAM,
        String() => ViewType.NEWS,
      };
}
