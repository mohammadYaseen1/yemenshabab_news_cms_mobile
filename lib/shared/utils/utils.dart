import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/utils.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:yemenshabab/services/home/models/news/news_entity.dart';
import 'package:yemenshabab/shared/config/config.dart';
import 'package:yemenshabab/shared/days.dart';

bool isArabic(BuildContext context) =>
    Localizations.localeOf(context).toLanguageTag() == "ar";

Color parseColorString(String colorString) {
  // Remove "rgb(" and ")" from the color string
  if (colorString.isEmpty) return Colors.white;

  String trimmed = colorString.replaceAll("rgb(", "").replaceAll(")", "");

  // Split the remaining string into components
  List<String> components = trimmed.split(',');

  // Parse each component as an integer
  int red = int.parse(components[0].trim());
  int green = int.parse(components[1].trim());
  int blue = int.parse(components[2].trim());
  double opacity = 1;
  opacity = components.length == 4 ? double.parse(components[2].trim()) : 1;

  // Create and return a Color object
  return Color.fromRGBO(
      red, green, blue, opacity); // 255 is for fully opaque color
}

String getFormattedDate(String dateStr, [String locale = 'ar']) {
  if (dateStr.isEmpty) return '';
  DateTime data = DateTime.parse(dateStr).toLocal();
  return DateFormat.yMMMd(locale).add_jm().format(data);
}

// String getFormattedTime(String inputTime,
//     {String locale = 'ar', String pattern = 'hh:mm a'}) {
//   try {
//     String sanitizedInputTime = inputTime
//         .replaceAll(RegExp(r'\u200B|\u00A0'), '')
//         .replaceAll('UTC', '')
//         .trim();
//     tz.Location location = tz.getLocation(Config.timeZoneName);
//     DateFormat inputFormat = DateFormat(pattern);
//     DateTime dateTime = inputFormat.parse(sanitizedInputTime, true);
//     tz.TZDateTime convertedDate = tz.TZDateTime.from(dateTime, location);
//     DateFormat outputFormat = DateFormat('hh:mm a', "ar");
//     String formattedTime = outputFormat.format(convertedDate);
//     return formattedTime;
//   } catch (e) {
//     debugPrint('Error ParseTime: $e');
//     return '';
//   }
// }

String getFormattedTime(String inputTime,
    {String locale = 'ar', String pattern = 'hh:mm a'}) {
  try {
    bool isUtc = inputTime.isCaseInsensitiveContains("utc");
    String sanitizedInputTime = inputTime
        .replaceAll(RegExp(r'\u200B|\u00A0'), '')
        .replaceAll('UTC', '')
        .trim();

    tz.Location location = tz.getLocation(Config.timeZoneName);
    DateFormat inputFormat = DateFormat(pattern);
    DateTime dateTime = inputFormat.parse(sanitizedInputTime, isUtc);
    DateTime convertedDate =
        isUtc ? tz.TZDateTime.from(dateTime, location) : dateTime;
    DateFormat outputFormat = DateFormat('hh:mm a', locale);
    String formattedTime = outputFormat.format(convertedDate);
    return formattedTime;
  } catch (e) {
    debugPrint('Error ParseTime: $e');
    return '';
  }
}

bool isFutureDate(String dateStr) {
  if (dateStr.isEmpty) return false;
  DateTime otherDate = DateTime.parse(dateStr);
  Duration difference = DateTime.now().difference(otherDate);
  return difference.isNegative;
}

String getDurationString(String otherDateStr, [String language = 'ar']) {
  if (otherDateStr.isEmpty) return "";
  print("getDurationString: $otherDateStr");
  DateTime today = DateTime.now().toUtc();
  DateTime otherDate = DateTime.parse(otherDateStr).toUtc();
  Duration difference = today.difference(otherDate);
  print("difference: $difference");
  print("today: $today");
  print("otherDate: $otherDate");
  if (language == 'ar') {
    if (difference.inDays > 0) {
      if (difference.inDays == 1) {
        return 'يوم واحد';
      } else if (difference.inDays == 2) {
        return 'يومين';
      } else if (difference.inDays ~/ 30 > 0) {
        int mounth = difference.inDays ~/ 30;
        if (mounth == 2) {
          return 'شهرين';
        } else if (mounth >= 12) {
          return '${mounth ~/ 12} سنة';
        } else {
          return '${mounth} شهر';
        }
      } else {
        return '${difference.inDays} يوم';
      }
    } else if (difference.inHours > 0) {
      if (difference.inHours == 1) {
        return 'ساعة واحدة';
      } else if (difference.inHours == 2) {
        return 'ساعتين';
      } else {
        return '${difference.inHours} ساعة';
      }
    } else if (difference.inMinutes > 0) {
      if (difference.inMinutes == 1) {
        return 'دقيقة واحدة';
      } else if (difference.inMinutes == 2) {
        return 'دقيقتين';
      } else {
        return '${difference.inMinutes} دقائق';
      }
    } else {
      if (difference.inSeconds == 1) {
        return 'ثانية واحدة';
      } else if (difference.inSeconds == 2) {
        return 'ثانيتين';
      } else {
        return '${difference.inSeconds} ثانية';
      }
    }
  } else {
    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'}';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} min';
    } else {
      return '${difference.inSeconds} sec';
    }
  }
}

String? convertUrlToId(String url, {bool trimWhitespaces = true}) {
  if (!url.contains("http") && (url.length == 11)) return url;
  if (trimWhitespaces) url = url.trim();

  for (var exp in [
    RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(
        r"^https:\/\/(?:music\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube\.com\/shorts\/([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
  ]) {
    Match? match = exp.firstMatch(url);
    if (match != null && match.groupCount >= 1) return match.group(1);
  }

  return null;
}

String getDay(BuildContext context, String day) {
  return switch (day.toLowerCase()) {
    'sunday' => AppLocalizations.of(context)!.sunday,
    'monday' => AppLocalizations.of(context)!.monday,
    'tuesday' => AppLocalizations.of(context)!.tuesday,
    'wednesday' => AppLocalizations.of(context)!.wednesday,
    'thursday' => AppLocalizations.of(context)!.thursday,
    'friday' => AppLocalizations.of(context)!.friday,
    'saturday' => AppLocalizations.of(context)!.saturday,
    String() => AppLocalizations.of(context)!.sunday,
  };
}

int compareDate(String date1, String date2, [String pattern = 'hh:mm a']) {
  DateFormat inputFormat = DateFormat(pattern);
  DateTime dateTime1 = inputFormat.parse(date1.replaceFirst(' UTC', ''));
  DateTime dateTime2 = inputFormat.parse(date2.replaceFirst(' UTC', ''));
  return dateTime2.difference(dateTime1).inMilliseconds;
}

bool isActiveDate(
    {required String date,
    required Duration duration,
    String pattern = 'hh:mm a',
    required Days day}) {
  DateFormat inputFormat = DateFormat(pattern);
  bool isUtc = date.isCaseInsensitiveContains("utc");
  tz.Location yemenLocation = tz.getLocation(Config.timeZoneName);
  late DateTime now;
  DateTime dateTime = inputFormat.parse(date.replaceFirst(' UTC', ''));
  if (isUtc) {
    now = DateTime.now().toUtc();
  } else {
    now = tz.TZDateTime.from(DateTime.now(), yemenLocation);
    dateTime = tz.TZDateTime.from(dateTime, yemenLocation);
  }
  DateTime start = DateTime(0, 1, 1, dateTime.hour, dateTime.minute,
      dateTime.second, dateTime.millisecond, dateTime.microsecond);
  DateTime timeNow = DateTime(0, 1, 1, now.hour, now.minute, now.second,
      now.millisecond, now.microsecond);
  bool isToday = day == Days.getDayEnum(now.weekday);
  DateTime end = start.add(duration);
  return isToday && timeNow.isAfter(start) && timeNow.isBefore(end);
}

String makeSharedUrl(BuildContext context, NewsEntity news) {
  return "${Config.webUrl}/${Localizations.localeOf(context).toLanguageTag()}/sections/${news.dataType}/${news.category!.nameEn}/${news.uuid}";
}
