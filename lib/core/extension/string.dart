import 'dart:ui';

extension Format on String {
  String take(int length) {
    if (length > this.length) return this;
    return substring(0, length);
  }

  Color get toColor =>
      Color(int.parse(substring(1, 7), radix: 16) + 0xFF000000);
}
