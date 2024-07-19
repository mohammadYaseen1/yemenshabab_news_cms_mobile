import 'dart:convert';

import 'package:yemenshabab_news_cms_mobile/generated/json/base/json_field.dart';
import 'package:yemenshabab_news_cms_mobile/generated/json/news_entity.g.dart';

export 'package:yemenshabab_news_cms_mobile/generated/json/news_entity.g.dart';

@JsonSerializable()
class NewsEntity {
  String? uuid;
  String? image;
  String? creationDate;
  String? views;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  String? contentAr;
  String? contentEn;
  String? dataType;
  NewsCategory? category;
  NewsKeywords? keywords;
  NewsExtras? extras;

  NewsEntity();

  factory NewsEntity.fromJson(Map<String, dynamic> json) =>
      $NewsEntityFromJson(json);

  Map<String, dynamic> toJson() => $NewsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NewsCategory {
  String? nameAr;
  String? nameEn;
  String? categoryColor;

  NewsCategory();

  factory NewsCategory.fromJson(Map<String, dynamic> json) =>
      $NewsCategoryFromJson(json);

  Map<String, dynamic> toJson() => $NewsCategoryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NewsKeywords {
  List<String>? ar;
  List<String>? en;

  NewsKeywords();

  factory NewsKeywords.fromJson(Map<String, dynamic> json) =>
      $NewsKeywordsFromJson(json);

  Map<String, dynamic> toJson() => $NewsKeywordsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NewsExtras {
  String? imageCaption;
  String? imageCaptionEn;
  String? source;
  String? sourceEn;
  String? writerId;
  String? writerImage;
  String? writerLinks;
  String? writerName;
  String? writerNameEn;
  String? writerFacebook;
  String? writerInstagram;
  String? writerLinkedin;
  String? writerTelegram;
  String? writerTwitter;

  NewsExtras();

  factory NewsExtras.fromJson(Map<String, dynamic> json) =>
      $NewsExtrasFromJson(json);

  Map<String, dynamic> toJson() => $NewsExtrasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
