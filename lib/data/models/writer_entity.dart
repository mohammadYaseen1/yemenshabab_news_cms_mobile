import 'package:yemenshabab/generated/json/base/json_field.dart';
import 'package:yemenshabab/generated/json/writer_entity.g.dart';
import 'dart:convert';
export 'package:yemenshabab/generated/json/writer_entity.g.dart';

@JsonSerializable()
class WriterEntity {
  WriterWriter? writer;
  WriterArticles? articles;

  WriterEntity();

  factory WriterEntity.fromJson(Map<String, dynamic> json) =>
      $WriterEntityFromJson(json);

  Map<String, dynamic> toJson() => $WriterEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WriterWriter {
  String? uuid;
  String? firstName;
  String? lastName;
  String? email;
  bool? enabled;
  String? creationDate;
  String? createdBy;
  String? image;
  String? writerType;
  String? lastModificationDate;
  String? modifiedBy;
  String? facebook;
  String? twitter;
  String? linkedin;
  String? telegram;
  String? instagram;
  bool? showLinks;
  String? firstNameEn;
  String? lastNameEn;

  WriterWriter();

  factory WriterWriter.fromJson(Map<String, dynamic> json) =>
      $WriterWriterFromJson(json);

  Map<String, dynamic> toJson() => $WriterWriterToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WriterArticles {
  List<WriterArticlesResources>? resources;
  String? totalRecords;

  WriterArticles();

  factory WriterArticles.fromJson(Map<String, dynamic> json) =>
      $WriterArticlesFromJson(json);

  Map<String, dynamic> toJson() => $WriterArticlesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WriterArticlesResources {
  String? uuid;
  String? image;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  String? creationDate;
  String? category;
  String? categoryId;
  String? categoryAr;
  String? categoryColor;
  String? section;
  String? writerImage;
  String? writerName;
  String? sourceAr;
  String? sourceEn;

  WriterArticlesResources();

  factory WriterArticlesResources.fromJson(Map<String, dynamic> json) =>
      $WriterArticlesResourcesFromJson(json);

  Map<String, dynamic> toJson() => $WriterArticlesResourcesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
