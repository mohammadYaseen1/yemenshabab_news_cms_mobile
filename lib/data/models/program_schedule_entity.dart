import 'dart:convert';

import 'package:yemenshabab/generated/json/base/json_field.dart';
import 'package:yemenshabab/generated/json/program_schedule_entity.g.dart';
import 'package:yemenshabab/shared/utils/utils.dart';

export 'package:yemenshabab/generated/json/program_schedule_entity.g.dart';

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
    programs?.sort((a, b) => compareDate(b.showTime!, a.showTime!));
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
  String? showDuration;

  ProgramSchedulePrograms();

  factory ProgramSchedulePrograms.fromJson(Map<String, dynamic> json) =>
      $ProgramScheduleProgramsFromJson(json);

  Map<String, dynamic> toJson() => $ProgramScheduleProgramsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
