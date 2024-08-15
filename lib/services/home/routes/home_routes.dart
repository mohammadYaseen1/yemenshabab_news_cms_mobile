import 'package:yemenshabab/shared/config/config.dart';

class HomeRoutes {
  static final String fetchSections =
      '${Config.baseUrl}/api/v1/main/landing/sections';

  static final String fetchLanding =
      '${Config.baseUrl}/api/v1/main/landing/section-layouts/full';

  static String fetchPrograms({required int rows, required int first}) =>
      '${Config.baseUrl}/api/v1/main/programs/active?rows=$rows&first=$first';

  static String fetchWriters(
          {required int rows, required int first, required String uuid}) =>
      '${Config.baseUrl}/api/v1/main/writer/articles/$uuid?rows=$rows&first=$first';

  static String fetchPlaylist = '${Config.youtubeApiUrl}/playlistItems';

  static final String fetchProgramsSchedule =
      '${Config.baseUrl}/api/v1/main/programs-schedule';

  static String getProgram(String uuid) =>
      '${Config.baseUrl}/api/v1/main/program/$uuid';

  static String fetchNews({required String uuid, required String dataType}) =>
      '${Config.baseUrl}/api/v1/main/landing/page/$dataType/$uuid';

  static String fetchByKeywords(
          {required String dataType, required List<String> keywords}) =>
      '${Config.baseUrl}/api/v1/main/related/data/$dataType/${keywords.join(",")}';

  static String fetchCategoryData(
          {required String dataType,
          required String category,
          required int rows,
          required int first}) =>
      '${Config.baseUrl}/api/v1/main/landing/page?dataType=$dataType&category=$category&rows=$rows&first=$first';

  static String search({
    required String searchTarget,
    required int rows,
    required int first,
  }) =>
      '${Config.baseUrl}/api/v1/main/search?searchTarget=$searchTarget&rows=$rows&first=$first';
}
