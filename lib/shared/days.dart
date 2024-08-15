enum Days {
  Saturday,
  Sunday,
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday;

  static Days valueOf(String name) {
    return switch (name.toLowerCase()) {
      'monday' => Monday,
      'tuesday' => Tuesday,
      'wednesday' => Wednesday,
      'thursday' => Thursday,
      'friday' => Friday,
      'saturday' => Saturday,
      'sunday' => Sunday,
      String() => Sunday,
    };
  }

  static int getIndex({String? name, Days? day, int? dayOfWeek}) {
    if (name != null) return values.indexOf(valueOf(name));
    if (day != null) return values.indexOf(day);
    if (dayOfWeek != null) return values.indexOf(getDayEnum(dayOfWeek));
    return 0;
  }

  static Days getDayEnum(int dayOfWeek) {
    return switch (dayOfWeek) {
      1 => Monday,
      2 => Tuesday,
      3 => Wednesday,
      4 => Thursday,
      5 => Friday,
      6 => Saturday,
      7 => Sunday,
      int() => Sunday,
    };
  }
}
