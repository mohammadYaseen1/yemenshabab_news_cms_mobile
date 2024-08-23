import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemenshabab/core/config/config.dart';
import 'package:yemenshabab/core/utils/utils.dart';

enum ProgramStatus {
  AIRING(Color.fromRGBO(73, 149, 32, 0.8)),
  FINISHED(Color.fromRGBO(153, 27, 27, 0.8)),
  SOON(Color.fromRGBO(24, 58, 203, 0.8));

  final Color color;

  const ProgramStatus(this.color);

  static Color getColor(String status) {
    var airingColor = Config.settings?.programStatusColor?.aIRING;
    var finishedColor = Config.settings?.programStatusColor?.fINISHED;
    var soonColor = Config.settings?.programStatusColor?.sOON;
    return switch (valueOf(status)) {
      AIRING =>
        airingColor == null ? AIRING.color : parseColorString(airingColor),
      FINISHED =>
        finishedColor == null ? AIRING.color : parseColorString(finishedColor),
      SOON => soonColor == null ? AIRING.color : parseColorString(soonColor),
    };
  }

  static ProgramStatus valueOf(String status) => switch (status) {
        'AIRING' => AIRING,
        'FINISHED' => FINISHED,
        'SOON' => SOON,
        String() => AIRING,
      };

  static String? titleOf(
    BuildContext context, {
    ProgramStatus? status,
    String? statusString,
  }) =>
      status == null && statusString == null
          ? null
          : switch (status ?? valueOf(statusString!)) {
              AIRING => 'airing'.tr,
              FINISHED => 'finished'.tr,
              SOON => 'soon'.tr,
            };
}
