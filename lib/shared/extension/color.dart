import 'dart:ui';

extension Format on Color {
  static Color fromHex(String hex) =>
      Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
}
