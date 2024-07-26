import 'package:yemenshabab/generated/json/base/json_convert_content.dart';
import 'package:yemenshabab/data/models/section/section_data_entity.dart';

SectionDataEntity $SectionDataEntityFromJson(Map<String, dynamic> json) {
  final SectionDataEntity sectionDataEntity = SectionDataEntity();
  final List<SectionDataData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<SectionDataData>(e) as SectionDataData)
      .toList();
  if (data != null) {
    sectionDataEntity.data = data;
  }
  final List<SectionDataLatestData>? latestData = (json['latestData'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<SectionDataLatestData>(e) as SectionDataLatestData)
      .toList();
  if (latestData != null) {
    sectionDataEntity.latestData = latestData;
  }
  final List<SectionDataMostViewed>? mostViewed = (json['mostViewed'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<SectionDataMostViewed>(e) as SectionDataMostViewed)
      .toList();
  if (mostViewed != null) {
    sectionDataEntity.mostViewed = mostViewed;
  }
  final String? layoutType = jsonConvert.convert<String>(json['layoutType']);
  if (layoutType != null) {
    sectionDataEntity.layoutType = layoutType;
  }
  final String? totalRecords = jsonConvert.convert<String>(
      json['totalRecords']);
  if (totalRecords != null) {
    sectionDataEntity.totalRecords = totalRecords;
  }
  final String? color = jsonConvert.convert<String>(json['color']);
  if (color != null) {
    sectionDataEntity.color = color;
  }
  final String? categoryAr = jsonConvert.convert<String>(json['categoryAr']);
  if (categoryAr != null) {
    sectionDataEntity.categoryAr = categoryAr;
  }
  return sectionDataEntity;
}

Map<String, dynamic> $SectionDataEntityToJson(SectionDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['latestData'] = entity.latestData?.map((v) => v.toJson()).toList();
  data['mostViewed'] = entity.mostViewed?.map((v) => v.toJson()).toList();
  data['layoutType'] = entity.layoutType;
  data['totalRecords'] = entity.totalRecords;
  data['color'] = entity.color;
  data['categoryAr'] = entity.categoryAr;
  return data;
}

extension SectionDataEntityExtension on SectionDataEntity {
  SectionDataEntity copyWith({
    List<SectionDataData>? data,
    List<SectionDataLatestData>? latestData,
    List<SectionDataMostViewed>? mostViewed,
    String? layoutType,
    String? totalRecords,
    String? color,
    String? categoryAr,
  }) {
    return SectionDataEntity()
      ..data = data ?? this.data
      ..latestData = latestData ?? this.latestData
      ..mostViewed = mostViewed ?? this.mostViewed
      ..layoutType = layoutType ?? this.layoutType
      ..totalRecords = totalRecords ?? this.totalRecords
      ..color = color ?? this.color
      ..categoryAr = categoryAr ?? this.categoryAr;
  }
}

SectionDataData $SectionDataDataFromJson(Map<String, dynamic> json) {
  final SectionDataData sectionDataData = SectionDataData();
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    sectionDataData.uuid = uuid;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    sectionDataData.image = image;
  }
  final String? titleAr = jsonConvert.convert<String>(json['titleAr']);
  if (titleAr != null) {
    sectionDataData.titleAr = titleAr;
  }
  final String? titleEn = jsonConvert.convert<String>(json['titleEn']);
  if (titleEn != null) {
    sectionDataData.titleEn = titleEn;
  }
  final String? descriptionAr = jsonConvert.convert<String>(
      json['descriptionAr']);
  if (descriptionAr != null) {
    sectionDataData.descriptionAr = descriptionAr;
  }
  final String? descriptionEn = jsonConvert.convert<String>(
      json['descriptionEn']);
  if (descriptionEn != null) {
    sectionDataData.descriptionEn = descriptionEn;
  }
  final String? creationDate = jsonConvert.convert<String>(
      json['creationDate']);
  if (creationDate != null) {
    sectionDataData.creationDate = creationDate;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    sectionDataData.category = category;
  }
  final String? categoryId = jsonConvert.convert<String>(json['categoryId']);
  if (categoryId != null) {
    sectionDataData.categoryId = categoryId;
  }
  final String? categoryAr = jsonConvert.convert<String>(json['categoryAr']);
  if (categoryAr != null) {
    sectionDataData.categoryAr = categoryAr;
  }
  final String? categoryColor = jsonConvert.convert<String>(
      json['categoryColor']);
  if (categoryColor != null) {
    sectionDataData.categoryColor = categoryColor;
  }
  final String? section = jsonConvert.convert<String>(json['section']);
  if (section != null) {
    sectionDataData.section = section;
  }
  final String? writerImage = jsonConvert.convert<String>(json['writerImage']);
  if (writerImage != null) {
    sectionDataData.writerImage = writerImage;
  }
  final String? writerName = jsonConvert.convert<String>(json['writerName']);
  if (writerName != null) {
    sectionDataData.writerName = writerName;
  }
  return sectionDataData;
}

Map<String, dynamic> $SectionDataDataToJson(SectionDataData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uuid'] = entity.uuid;
  data['image'] = entity.image;
  data['titleAr'] = entity.titleAr;
  data['titleEn'] = entity.titleEn;
  data['descriptionAr'] = entity.descriptionAr;
  data['descriptionEn'] = entity.descriptionEn;
  data['creationDate'] = entity.creationDate;
  data['category'] = entity.category;
  data['categoryId'] = entity.categoryId;
  data['categoryAr'] = entity.categoryAr;
  data['categoryColor'] = entity.categoryColor;
  data['section'] = entity.section;
  data['writerImage'] = entity.writerImage;
  data['writerName'] = entity.writerName;
  return data;
}

extension SectionDataDataExtension on SectionDataData {
  SectionDataData copyWith({
    String? uuid,
    String? image,
    String? titleAr,
    String? titleEn,
    String? descriptionAr,
    String? descriptionEn,
    String? creationDate,
    String? category,
    String? categoryId,
    String? categoryAr,
    String? categoryColor,
    String? section,
    String? writerImage,
    String? writerName,
  }) {
    return SectionDataData()
      ..uuid = uuid ?? this.uuid
      ..image = image ?? this.image
      ..titleAr = titleAr ?? this.titleAr
      ..titleEn = titleEn ?? this.titleEn
      ..descriptionAr = descriptionAr ?? this.descriptionAr
      ..descriptionEn = descriptionEn ?? this.descriptionEn
      ..creationDate = creationDate ?? this.creationDate
      ..category = category ?? this.category
      ..categoryId = categoryId ?? this.categoryId
      ..categoryAr = categoryAr ?? this.categoryAr
      ..categoryColor = categoryColor ?? this.categoryColor
      ..section = section ?? this.section
      ..writerImage = writerImage ?? this.writerImage
      ..writerName = writerName ?? this.writerName;
  }
}

SectionDataLatestData $SectionDataLatestDataFromJson(
    Map<String, dynamic> json) {
  final SectionDataLatestData sectionDataLatestData = SectionDataLatestData();
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    sectionDataLatestData.uuid = uuid;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    sectionDataLatestData.image = image;
  }
  final String? titleAr = jsonConvert.convert<String>(json['titleAr']);
  if (titleAr != null) {
    sectionDataLatestData.titleAr = titleAr;
  }
  final String? titleEn = jsonConvert.convert<String>(json['titleEn']);
  if (titleEn != null) {
    sectionDataLatestData.titleEn = titleEn;
  }
  final String? descriptionAr = jsonConvert.convert<String>(
      json['descriptionAr']);
  if (descriptionAr != null) {
    sectionDataLatestData.descriptionAr = descriptionAr;
  }
  final String? descriptionEn = jsonConvert.convert<String>(
      json['descriptionEn']);
  if (descriptionEn != null) {
    sectionDataLatestData.descriptionEn = descriptionEn;
  }
  final String? creationDate = jsonConvert.convert<String>(
      json['creationDate']);
  if (creationDate != null) {
    sectionDataLatestData.creationDate = creationDate;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    sectionDataLatestData.category = category;
  }
  final String? categoryId = jsonConvert.convert<String>(json['categoryId']);
  if (categoryId != null) {
    sectionDataLatestData.categoryId = categoryId;
  }
  final String? categoryAr = jsonConvert.convert<String>(json['categoryAr']);
  if (categoryAr != null) {
    sectionDataLatestData.categoryAr = categoryAr;
  }
  final String? categoryColor = jsonConvert.convert<String>(
      json['categoryColor']);
  if (categoryColor != null) {
    sectionDataLatestData.categoryColor = categoryColor;
  }
  final String? section = jsonConvert.convert<String>(json['section']);
  if (section != null) {
    sectionDataLatestData.section = section;
  }
  final String? writerImage = jsonConvert.convert<String>(json['writerImage']);
  if (writerImage != null) {
    sectionDataLatestData.writerImage = writerImage;
  }
  final String? writerName = jsonConvert.convert<String>(json['writerName']);
  if (writerName != null) {
    sectionDataLatestData.writerName = writerName;
  }
  return sectionDataLatestData;
}

Map<String, dynamic> $SectionDataLatestDataToJson(
    SectionDataLatestData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uuid'] = entity.uuid;
  data['image'] = entity.image;
  data['titleAr'] = entity.titleAr;
  data['titleEn'] = entity.titleEn;
  data['descriptionAr'] = entity.descriptionAr;
  data['descriptionEn'] = entity.descriptionEn;
  data['creationDate'] = entity.creationDate;
  data['category'] = entity.category;
  data['categoryId'] = entity.categoryId;
  data['categoryAr'] = entity.categoryAr;
  data['categoryColor'] = entity.categoryColor;
  data['section'] = entity.section;
  data['writerImage'] = entity.writerImage;
  data['writerName'] = entity.writerName;
  return data;
}

extension SectionDataLatestDataExtension on SectionDataLatestData {
  SectionDataLatestData copyWith({
    String? uuid,
    String? image,
    String? titleAr,
    String? titleEn,
    String? descriptionAr,
    String? descriptionEn,
    String? creationDate,
    String? category,
    String? categoryId,
    String? categoryAr,
    String? categoryColor,
    String? section,
    String? writerImage,
    String? writerName,
  }) {
    return SectionDataLatestData()
      ..uuid = uuid ?? this.uuid
      ..image = image ?? this.image
      ..titleAr = titleAr ?? this.titleAr
      ..titleEn = titleEn ?? this.titleEn
      ..descriptionAr = descriptionAr ?? this.descriptionAr
      ..descriptionEn = descriptionEn ?? this.descriptionEn
      ..creationDate = creationDate ?? this.creationDate
      ..category = category ?? this.category
      ..categoryId = categoryId ?? this.categoryId
      ..categoryAr = categoryAr ?? this.categoryAr
      ..categoryColor = categoryColor ?? this.categoryColor
      ..section = section ?? this.section
      ..writerImage = writerImage ?? this.writerImage
      ..writerName = writerName ?? this.writerName;
  }
}

SectionDataMostViewed $SectionDataMostViewedFromJson(
    Map<String, dynamic> json) {
  final SectionDataMostViewed sectionDataMostViewed = SectionDataMostViewed();
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    sectionDataMostViewed.uuid = uuid;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    sectionDataMostViewed.image = image;
  }
  final String? titleAr = jsonConvert.convert<String>(json['titleAr']);
  if (titleAr != null) {
    sectionDataMostViewed.titleAr = titleAr;
  }
  final String? titleEn = jsonConvert.convert<String>(json['titleEn']);
  if (titleEn != null) {
    sectionDataMostViewed.titleEn = titleEn;
  }
  final String? descriptionAr = jsonConvert.convert<String>(
      json['descriptionAr']);
  if (descriptionAr != null) {
    sectionDataMostViewed.descriptionAr = descriptionAr;
  }
  final String? descriptionEn = jsonConvert.convert<String>(
      json['descriptionEn']);
  if (descriptionEn != null) {
    sectionDataMostViewed.descriptionEn = descriptionEn;
  }
  final String? creationDate = jsonConvert.convert<String>(
      json['creationDate']);
  if (creationDate != null) {
    sectionDataMostViewed.creationDate = creationDate;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    sectionDataMostViewed.category = category;
  }
  final String? categoryId = jsonConvert.convert<String>(json['categoryId']);
  if (categoryId != null) {
    sectionDataMostViewed.categoryId = categoryId;
  }
  final String? categoryAr = jsonConvert.convert<String>(json['categoryAr']);
  if (categoryAr != null) {
    sectionDataMostViewed.categoryAr = categoryAr;
  }
  final String? categoryColor = jsonConvert.convert<String>(
      json['categoryColor']);
  if (categoryColor != null) {
    sectionDataMostViewed.categoryColor = categoryColor;
  }
  final String? section = jsonConvert.convert<String>(json['section']);
  if (section != null) {
    sectionDataMostViewed.section = section;
  }
  final String? writerImage = jsonConvert.convert<String>(json['writerImage']);
  if (writerImage != null) {
    sectionDataMostViewed.writerImage = writerImage;
  }
  final String? writerName = jsonConvert.convert<String>(json['writerName']);
  if (writerName != null) {
    sectionDataMostViewed.writerName = writerName;
  }
  return sectionDataMostViewed;
}

Map<String, dynamic> $SectionDataMostViewedToJson(
    SectionDataMostViewed entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uuid'] = entity.uuid;
  data['image'] = entity.image;
  data['titleAr'] = entity.titleAr;
  data['titleEn'] = entity.titleEn;
  data['descriptionAr'] = entity.descriptionAr;
  data['descriptionEn'] = entity.descriptionEn;
  data['creationDate'] = entity.creationDate;
  data['category'] = entity.category;
  data['categoryId'] = entity.categoryId;
  data['categoryAr'] = entity.categoryAr;
  data['categoryColor'] = entity.categoryColor;
  data['section'] = entity.section;
  data['writerImage'] = entity.writerImage;
  data['writerName'] = entity.writerName;
  return data;
}

extension SectionDataMostViewedExtension on SectionDataMostViewed {
  SectionDataMostViewed copyWith({
    String? uuid,
    String? image,
    String? titleAr,
    String? titleEn,
    String? descriptionAr,
    String? descriptionEn,
    String? creationDate,
    String? category,
    String? categoryId,
    String? categoryAr,
    String? categoryColor,
    String? section,
    String? writerImage,
    String? writerName,
  }) {
    return SectionDataMostViewed()
      ..uuid = uuid ?? this.uuid
      ..image = image ?? this.image
      ..titleAr = titleAr ?? this.titleAr
      ..titleEn = titleEn ?? this.titleEn
      ..descriptionAr = descriptionAr ?? this.descriptionAr
      ..descriptionEn = descriptionEn ?? this.descriptionEn
      ..creationDate = creationDate ?? this.creationDate
      ..category = category ?? this.category
      ..categoryId = categoryId ?? this.categoryId
      ..categoryAr = categoryAr ?? this.categoryAr
      ..categoryColor = categoryColor ?? this.categoryColor
      ..section = section ?? this.section
      ..writerImage = writerImage ?? this.writerImage
      ..writerName = writerName ?? this.writerName;
  }
}