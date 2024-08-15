import 'package:flutter/services.dart';

Future<String> getReleaseVersion() async {
  final contents = await rootBundle.loadString('pubspec.yaml');
  final lines = contents.split('\n');

  for (var line in lines) {
    if (line.startsWith('version:')) {
      final version = line.split(':')[1].trim();
      return version;
    }
  }
  return 'Error: Version not found';
}
