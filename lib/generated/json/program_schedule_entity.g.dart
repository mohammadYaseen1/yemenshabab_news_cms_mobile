import 'package:yemenshabab/data/models/program_schedule_entity.dart';
import 'package:yemenshabab/generated/json/base/json_convert_content.dart';

ProgramScheduleEntity $ProgramScheduleEntityFromJson(
    Map<String, dynamic> json) {
  final ProgramScheduleEntity programScheduleEntity = ProgramScheduleEntity();
  final List<ProgramSchedulePrograms>? programs =
      (json['programs'] as List<dynamic>?)
          ?.map((e) => jsonConvert.convert<ProgramSchedulePrograms>(e)
              as ProgramSchedulePrograms)
          .toList();
  if (programs != null) {
    programScheduleEntity.programs = programs;
  }
  final String? totalRecords =
      jsonConvert.convert<String>(json['totalRecords']);
  if (totalRecords != null) {
    programScheduleEntity.totalRecords = totalRecords;
  }
  return programScheduleEntity;
}

Map<String, dynamic> $ProgramScheduleEntityToJson(
    ProgramScheduleEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['programs'] = entity.programs?.map((v) => v.toJson()).toList();
  data['totalRecords'] = entity.totalRecords;
  return data;
}

extension ProgramScheduleEntityExtension on ProgramScheduleEntity {
  ProgramScheduleEntity copyWith({
    List<ProgramSchedulePrograms>? programs,
    String? totalRecords,
  }) {
    return ProgramScheduleEntity()
      ..programs = programs ?? this.programs
      ..totalRecords = totalRecords ?? this.totalRecords;
  }
}

ProgramSchedulePrograms $ProgramScheduleProgramsFromJson(
    Map<String, dynamic> json) {
  final ProgramSchedulePrograms programSchedulePrograms =
      ProgramSchedulePrograms();
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    programSchedulePrograms.uuid = uuid;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    programSchedulePrograms.title = title;
  }
  final String? titleAr = jsonConvert.convert<String>(json['titleAr']);
  if (titleAr != null) {
    programSchedulePrograms.titleAr = titleAr;
  }
  final String? showTime = jsonConvert.convert<String>(json['showTime']);
  if (showTime != null) {
    programSchedulePrograms.showTime = showTime;
  }
  final String? releaseDays = jsonConvert.convert<String>(json['releaseDays']);
  if (releaseDays != null) {
    programSchedulePrograms.releaseDays = releaseDays;
  }
  final String? programImage =
      jsonConvert.convert<String>(json['programImage']);
  if (programImage != null) {
    programSchedulePrograms.programImage = programImage;
  }
  final String? programUuid = jsonConvert.convert<String>(json['programUuid']);
  if (programUuid != null) {
    programSchedulePrograms.programUuid = programUuid;
  }
  final String? showDuration =
      jsonConvert.convert<String>(json['showDuration']);
  if (showDuration != null) {
    programSchedulePrograms.showDuration = showDuration;
  }
  return programSchedulePrograms;
}

Map<String, dynamic> $ProgramScheduleProgramsToJson(
    ProgramSchedulePrograms entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uuid'] = entity.uuid;
  data['title'] = entity.title;
  data['titleAr'] = entity.titleAr;
  data['showTime'] = entity.showTime;
  data['releaseDays'] = entity.releaseDays;
  data['programImage'] = entity.programImage;
  data['programUuid'] = entity.programUuid;
  data['showDuration'] = entity.showDuration;
  return data;
}

extension ProgramScheduleProgramsExtension on ProgramSchedulePrograms {
  ProgramSchedulePrograms copyWith({
    String? uuid,
    String? title,
    String? titleAr,
    String? showTime,
    String? releaseDays,
    String? programImage,
    String? programUuid,
    String? showDuration,
  }) {
    return ProgramSchedulePrograms()
      ..uuid = uuid ?? this.uuid
      ..title = title ?? this.title
      ..titleAr = titleAr ?? this.titleAr
      ..showTime = showTime ?? this.showTime
      ..releaseDays = releaseDays ?? this.releaseDays
      ..programImage = programImage ?? this.programImage
      ..programUuid = programUuid ?? this.programUuid
      ..showDuration = showDuration ?? this.showDuration;
  }
}
