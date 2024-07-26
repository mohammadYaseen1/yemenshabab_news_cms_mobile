import 'package:yemenshabab/generated/json/base/json_convert_content.dart';
import 'package:yemenshabab/services/home/models/section/section_entity.dart';

SectionEntity $SectionEntityFromJson(Map<String, dynamic> json) {
  final SectionEntity sectionEntity = SectionEntity();
  final List<SectionSections>? sections = (json['sections'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<SectionSections>(e) as SectionSections)
      .toList();
  if (sections != null) {
    sectionEntity.sections = sections;
  }
  final String? totalRecords = jsonConvert.convert<String>(
      json['totalRecords']);
  if (totalRecords != null) {
    sectionEntity.totalRecords = totalRecords;
  }
  return sectionEntity;
}

Map<String, dynamic> $SectionEntityToJson(SectionEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sections'] = entity.sections?.map((v) => v.toJson()).toList();
  data['totalRecords'] = entity.totalRecords;
  return data;
}

extension SectionEntityExtension on SectionEntity {
  SectionEntity copyWith({
    List<SectionSections>? sections,
    String? totalRecords,
  }) {
    return SectionEntity()
      ..sections = sections ?? this.sections
      ..totalRecords = totalRecords ?? this.totalRecords;
  }
}

SectionSections $SectionSectionsFromJson(Map<String, dynamic> json) {
  final SectionSections sectionSections = SectionSections();
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    sectionSections.uuid = uuid;
  }
  final String? nameAr = jsonConvert.convert<String>(json['nameAr']);
  if (nameAr != null) {
    sectionSections.nameAr = nameAr;
  }
  final String? nameEn = jsonConvert.convert<String>(json['nameEn']);
  if (nameEn != null) {
    sectionSections.nameEn = nameEn;
  }
  final bool? editable = jsonConvert.convert<bool>(json['editable']);
  if (editable != null) {
    sectionSections.editable = editable;
  }
  final List<
      SectionSectionsCategories>? categories = (json['categories'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<SectionSectionsCategories>(
          e) as SectionSectionsCategories).toList();
  if (categories != null) {
    sectionSections.categories = categories;
  }
  final String? dataType = jsonConvert.convert<String>(json['dataType']);
  if (dataType != null) {
    sectionSections.dataType = dataType;
  }
  final String? order = jsonConvert.convert<String>(json['order']);
  if (order != null) {
    sectionSections.order = order;
  }
  return sectionSections;
}

Map<String, dynamic> $SectionSectionsToJson(SectionSections entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uuid'] = entity.uuid;
  data['nameAr'] = entity.nameAr;
  data['nameEn'] = entity.nameEn;
  data['editable'] = entity.editable;
  data['categories'] = entity.categories?.map((v) => v.toJson()).toList();
  data['dataType'] = entity.dataType;
  data['order'] = entity.order;
  return data;
}

extension SectionSectionsExtension on SectionSections {
  SectionSections copyWith({
    String? uuid,
    String? nameAr,
    String? nameEn,
    bool? editable,
    List<SectionSectionsCategories>? categories,
    String? dataType,
    String? order,
  }) {
    return SectionSections()
      ..uuid = uuid ?? this.uuid
      ..nameAr = nameAr ?? this.nameAr
      ..nameEn = nameEn ?? this.nameEn
      ..editable = editable ?? this.editable
      ..categories = categories ?? this.categories
      ..dataType = dataType ?? this.dataType
      ..order = order ?? this.order;
  }
}

SectionSectionsCategories $SectionSectionsCategoriesFromJson(
    Map<String, dynamic> json) {
  final SectionSectionsCategories sectionSectionsCategories = SectionSectionsCategories();
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    sectionSectionsCategories.uuid = uuid;
  }
  final String? nameAr = jsonConvert.convert<String>(json['nameAr']);
  if (nameAr != null) {
    sectionSectionsCategories.nameAr = nameAr;
  }
  final String? nameEn = jsonConvert.convert<String>(json['nameEn']);
  if (nameEn != null) {
    sectionSectionsCategories.nameEn = nameEn;
  }
  final bool? editable = jsonConvert.convert<bool>(json['editable']);
  if (editable != null) {
    sectionSectionsCategories.editable = editable;
  }
  final bool? onBar = jsonConvert.convert<bool>(json['onBar']);
  if (onBar != null) {
    sectionSectionsCategories.onBar = onBar;
  }
  final String? layout = jsonConvert.convert<String>(json['layout']);
  if (layout != null) {
    sectionSectionsCategories.layout = layout;
  }
  final String? color = jsonConvert.convert<String>(json['color']);
  if (color != null) {
    sectionSectionsCategories.color = color;
  }
  final String? modifiedBy = jsonConvert.convert<String>(json['modifiedBy']);
  if (modifiedBy != null) {
    sectionSectionsCategories.modifiedBy = modifiedBy;
  }
  return sectionSectionsCategories;
}

Map<String, dynamic> $SectionSectionsCategoriesToJson(
    SectionSectionsCategories entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uuid'] = entity.uuid;
  data['nameAr'] = entity.nameAr;
  data['nameEn'] = entity.nameEn;
  data['editable'] = entity.editable;
  data['onBar'] = entity.onBar;
  data['layout'] = entity.layout;
  data['color'] = entity.color;
  data['modifiedBy'] = entity.modifiedBy;
  return data;
}

extension SectionSectionsCategoriesExtension on SectionSectionsCategories {
  SectionSectionsCategories copyWith({
    String? uuid,
    String? nameAr,
    String? nameEn,
    bool? editable,
    bool? onBar,
    String? layout,
    String? color,
    String? modifiedBy,
  }) {
    return SectionSectionsCategories()
      ..uuid = uuid ?? this.uuid
      ..nameAr = nameAr ?? this.nameAr
      ..nameEn = nameEn ?? this.nameEn
      ..editable = editable ?? this.editable
      ..onBar = onBar ?? this.onBar
      ..layout = layout ?? this.layout
      ..color = color ?? this.color
      ..modifiedBy = modifiedBy ?? this.modifiedBy;
  }
}