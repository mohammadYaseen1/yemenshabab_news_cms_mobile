import 'package:yemenshabab/core/constants/constants.dart';

enum ViewType {
  NEWS,
  STORY,
  VIDEO,
  PROGRAM,
  ADS,
  ARTICLE;

  static ViewType valueOf(String? type) => adsLayouts.contains(type ?? "")
      ? ViewType.ADS
      : switch (type ?? "") {
          "NEWS" => ViewType.NEWS,
          "STORY" => ViewType.STORY,
          "VIDEO" => ViewType.VIDEO,
          "ARTICLE" => ViewType.ARTICLE,
          "PROGRAM" => ViewType.PROGRAM,
          "ADS" => ViewType.ADS,
          String() => ViewType.NEWS,
        };
}
