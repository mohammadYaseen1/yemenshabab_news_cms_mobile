import 'package:yemenshabab_news_cms_mobile/generated/json/base/json_convert_content.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/program/program_entity.dart';

ProgramEntity $ProgramEntityFromJson(Map<String, dynamic> json) {
  final ProgramEntity programEntity = ProgramEntity();
  final List<ProgramPrograms>? programs = (json['programs'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ProgramPrograms>(e) as ProgramPrograms)
      .toList();
  if (programs != null) {
    programEntity.programs = programs;
  }
  final String? totalRecords = jsonConvert.convert<String>(
      json['totalRecords']);
  if (totalRecords != null) {
    programEntity.totalRecords = totalRecords;
  }
  return programEntity;
}

Map<String, dynamic> $ProgramEntityToJson(ProgramEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['programs'] = entity.programs?.map((v) => v.toJson()).toList();
  data['totalRecords'] = entity.totalRecords;
  return data;
}

extension ProgramEntityExtension on ProgramEntity {
  ProgramEntity copyWith({
    List<ProgramPrograms>? programs,
    String? totalRecords,
  }) {
    return ProgramEntity()
      ..programs = programs ?? this.programs
      ..totalRecords = totalRecords ?? this.totalRecords;
  }
}

ProgramPrograms $ProgramProgramsFromJson(Map<String, dynamic> json) {
  final ProgramPrograms programPrograms = ProgramPrograms();
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    programPrograms.uuid = uuid;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    programPrograms.image = image;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    programPrograms.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    programPrograms.description = description;
  }
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    programPrograms.time = time;
  }
  final String? titleAr = jsonConvert.convert<String>(json['titleAr']);
  if (titleAr != null) {
    programPrograms.titleAr = titleAr;
  }
  final String? descriptionAr = jsonConvert.convert<String>(
      json['descriptionAr']);
  if (descriptionAr != null) {
    programPrograms.descriptionAr = descriptionAr;
  }
  final String? timeAr = jsonConvert.convert<String>(json['timeAr']);
  if (timeAr != null) {
    programPrograms.timeAr = timeAr;
  }
  final String? playlistId = jsonConvert.convert<String>(json['playlistId']);
  if (playlistId != null) {
    programPrograms.playlistId = playlistId;
  }
  final String? programStatus = jsonConvert.convert<String>(
      json['programStatus']);
  if (programStatus != null) {
    programPrograms.programStatus = programStatus;
  }
  final String? views = jsonConvert.convert<String>(json['views']);
  if (views != null) {
    programPrograms.views = views;
  }
  final String? creationDate = jsonConvert.convert<String>(
      json['creationDate']);
  if (creationDate != null) {
    programPrograms.creationDate = creationDate;
  }
  final String? createdBy = jsonConvert.convert<String>(json['createdBy']);
  if (createdBy != null) {
    programPrograms.createdBy = createdBy;
  }
  final String? days = jsonConvert.convert<String>(json['days']);
  if (days != null) {
    programPrograms.days = days;
  }
  final String? lastModificationDate = jsonConvert.convert<String>(
      json['lastModificationDate']);
  if (lastModificationDate != null) {
    programPrograms.lastModificationDate = lastModificationDate;
  }
  final String? modifiedBy = jsonConvert.convert<String>(json['modifiedBy']);
  if (modifiedBy != null) {
    programPrograms.modifiedBy = modifiedBy;
  }
  final bool? isMain = jsonConvert.convert<bool>(json['isMain']);
  if (isMain != null) {
    programPrograms.isMain = isMain;
  }
  final bool? onMain = jsonConvert.convert<bool>(json['onMain']);
  if (onMain != null) {
    programPrograms.onMain = onMain;
  }
  final String? programOrder = jsonConvert.convert<String>(
      json['programOrder']);
  if (programOrder != null) {
    programPrograms.programOrder = programOrder;
  }
  return programPrograms;
}

Map<String, dynamic> $ProgramProgramsToJson(ProgramPrograms entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uuid'] = entity.uuid;
  data['image'] = entity.image;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['time'] = entity.time;
  data['titleAr'] = entity.titleAr;
  data['descriptionAr'] = entity.descriptionAr;
  data['timeAr'] = entity.timeAr;
  data['playlistId'] = entity.playlistId;
  data['programStatus'] = entity.programStatus;
  data['views'] = entity.views;
  data['creationDate'] = entity.creationDate;
  data['createdBy'] = entity.createdBy;
  data['days'] = entity.days;
  data['lastModificationDate'] = entity.lastModificationDate;
  data['modifiedBy'] = entity.modifiedBy;
  data['isMain'] = entity.isMain;
  data['onMain'] = entity.onMain;
  data['programOrder'] = entity.programOrder;
  return data;
}

extension ProgramProgramsExtension on ProgramPrograms {
  ProgramPrograms copyWith({
    String? uuid,
    String? image,
    String? title,
    String? description,
    String? time,
    String? titleAr,
    String? descriptionAr,
    String? timeAr,
    String? playlistId,
    String? programStatus,
    String? views,
    String? creationDate,
    String? createdBy,
    String? days,
    String? lastModificationDate,
    String? modifiedBy,
    bool? isMain,
    bool? onMain,
    String? programOrder,
  }) {
    return ProgramPrograms()
      ..uuid = uuid ?? this.uuid
      ..image = image ?? this.image
      ..title = title ?? this.title
      ..description = description ?? this.description
      ..time = time ?? this.time
      ..titleAr = titleAr ?? this.titleAr
      ..descriptionAr = descriptionAr ?? this.descriptionAr
      ..timeAr = timeAr ?? this.timeAr
      ..playlistId = playlistId ?? this.playlistId
      ..programStatus = programStatus ?? this.programStatus
      ..views = views ?? this.views
      ..creationDate = creationDate ?? this.creationDate
      ..createdBy = createdBy ?? this.createdBy
      ..days = days ?? this.days
      ..lastModificationDate = lastModificationDate ?? this.lastModificationDate
      ..modifiedBy = modifiedBy ?? this.modifiedBy
      ..isMain = isMain ?? this.isMain
      ..onMain = onMain ?? this.onMain
      ..programOrder = programOrder ?? this.programOrder;
  }
}