import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ProgramStatus {
  AIRING,
  FINISHED,
  SOON;

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
              AIRING => AppLocalizations.of(context)!.airing,
              FINISHED => AppLocalizations.of(context)!.finished,
              SOON => AppLocalizations.of(context)!.soon,
            };
}
