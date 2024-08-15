import 'package:yemenshabab/generated/json/base/json_field.dart';
import 'package:yemenshabab/generated/json/program_entity.g.dart';
import 'dart:convert';
export 'package:yemenshabab/generated/json/program_entity.g.dart';

@JsonSerializable()
class ProgramEntity {
  List<ProgramPrograms>? programs;
  String? totalRecords;

  ProgramEntity();

  factory ProgramEntity.fromJson(Map<String, dynamic> json) =>
      $ProgramEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProgramEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProgramPrograms {
  String? uuid;
  String? image;
  String? title;
  String? description;
  String? time;
  String? titleAr;
  String? descriptionAr;
  String? timeAr;
  String? playlistId;
  String? programStatus;
  String? views;
  String? creationDate;
  String? createdBy;
  String? days;
  String? lastModificationDate;
  String? modifiedBy;
  bool? isMain;
  bool? onMain;
  String? programOrder;

  ProgramPrograms();

  factory ProgramPrograms.fromJson(Map<String, dynamic> json) =>
      $ProgramProgramsFromJson(json);

  Map<String, dynamic> toJson() => $ProgramProgramsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
