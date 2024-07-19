import 'package:yemenshabab_news_cms_mobile/generated/json/base/json_field.dart';
import 'package:yemenshabab_news_cms_mobile/generated/json/program_schedule_entity.g.dart';
import 'dart:convert';

import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';
export 'package:yemenshabab_news_cms_mobile/generated/json/program_schedule_entity.g.dart';

@JsonSerializable()
class ProgramScheduleEntity {
  List<ProgramSchedulePrograms>? programs;
  String? totalRecords;

  ProgramScheduleEntity();

  factory ProgramScheduleEntity.fromJson(Map<String, dynamic> json) =>
      $ProgramScheduleEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProgramScheduleEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  void sortPrograms() {
    programs?.sort((a, b) => compareDate(a.showTime!, b.showTime!));
  }
}

@JsonSerializable()
class ProgramSchedulePrograms {
  String? uuid;
  String? title;
  String? titleAr;
  String? showTime;
  String? releaseDays;
  String? programImage;
  String? programUuid;

  ProgramSchedulePrograms();

  factory ProgramSchedulePrograms.fromJson(Map<String, dynamic> json) =>
      $ProgramScheduleProgramsFromJson(json);

  Map<String, dynamic> toJson() => $ProgramScheduleProgramsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
