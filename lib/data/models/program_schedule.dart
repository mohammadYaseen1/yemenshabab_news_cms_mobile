import 'dart:collection';

import 'package:yemenshabab_news_cms_mobile/data/models/program_schedule_entity.dart';
import 'package:yemenshabab_news_cms_mobile/shared/days.dart';

export 'package:yemenshabab_news_cms_mobile/generated/json/program_schedule_entity.g.dart';

class ProgramSchedule {
  Map<Days, List<ProgramSchedulePrograms>> _data = {};

  UnmodifiableMapView<Days, List<ProgramSchedulePrograms>> get data =>
      UnmodifiableMapView(_data);

  void put(Days day, ProgramSchedulePrograms program) {
    if (!_data.containsKey(day)) _data[day] = [];
    _data[day]!.add(program);
  }
}
