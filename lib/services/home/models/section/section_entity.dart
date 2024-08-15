import 'package:yemenshabab/generated/json/base/json_field.dart';
import 'package:yemenshabab/generated/json/section_entity.g.dart';
import 'dart:convert';
export 'package:yemenshabab/generated/json/section_entity.g.dart';

@JsonSerializable()
class SectionEntity {
  List<SectionSections>? sections;
  String? totalRecords;

  SectionEntity();

  factory SectionEntity.fromJson(Map<String, dynamic> json) =>
      $SectionEntityFromJson(json);

  Map<String, dynamic> toJson() => $SectionEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SectionSections {
  String? uuid;
  String? nameAr;
  String? nameEn;
  bool? editable;
  List<SectionSectionsCategories>? categories;
  String? dataType;
  String? order;

  SectionSections();

  factory SectionSections.fromJson(Map<String, dynamic> json) =>
      $SectionSectionsFromJson(json);

  Map<String, dynamic> toJson() => $SectionSectionsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SectionSectionsCategories {
  String? uuid;
  String? nameAr;
  String? nameEn;
  bool? editable;
  bool? onBar;
  String? layout;
  String? color;
  String? modifiedBy;

  SectionSectionsCategories();

  factory SectionSectionsCategories.fromJson(Map<String, dynamic> json) =>
      $SectionSectionsCategoriesFromJson(json);

  Map<String, dynamic> toJson() => $SectionSectionsCategoriesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
