import 'package:yemenshabab_news_cms_mobile/data/models/playlist_entity.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/program_schedule_entity.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/section/section_data_entity.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/writer_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/landing/data.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/landing/landing.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/news/news_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/program/program_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/section/section_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/routes/home_routes.dart';
import 'package:yemenshabab_news_cms_mobile/shared/config/config.dart';
import 'package:yemenshabab_news_cms_mobile/shared/network/dio_factory.dart';

class HomeRepository {
  final dioFactory = DioFactory();

  Future<Landing> fetchLanding(String language) async {
    // return Future.delayed(
    //     Durations.extralong4, () => Landing.fromJson(landingJson));

    var dio = await dioFactory.getDio();
    final response = await dio.get(HomeRoutes.fetchLanding, queryParameters: {
      "language": language,
      // "language": Localizations.localeOf(context).toLanguageTag(),
    });

    if (response.statusCode == 200) {
      return Landing.fromJson(response.data);
    } else {
      throw Exception('Failed to load landing');
    }
  }

  Future<SectionEntity> fetchSections() async {
    // return Future.delayed(
    //     Durations.extralong4, () => SectionEntity.fromJson(sectionJson));
    var dio = await dioFactory.getDio();
    final response = await dio.get(HomeRoutes.fetchSections);
    if (response.statusCode == 200) {
      return SectionEntity.fromJson(response.data);
    } else {
      throw Exception('Failed to load Section');
    }
  }

  Future<PlaylistEntity> fetchPlaylist(String id, int count) async {
    var dio = await dioFactory.getDio();
    final Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': id,
      'maxResults': '$count',
      'key': Config.API_KEY,
    };

    final response =
        await dio.get(HomeRoutes.fetchPlaylist, queryParameters: parameters);
    if (response.statusCode == 200) {
      return PlaylistEntity.fromJson(response.data);
    } else {
      throw Exception('Failed to load playlist [$id], ${response}');
    }
  }

  Future<ProgramEntity> fetchPrograms(
      {required int rows, required int first}) async {
    // return Future.delayed(
    //     Durations.extralong4, () => ProgramEntity.fromJson(programJson));

    var dio = await dioFactory.getDio();
    final response =
        await dio.get(HomeRoutes.fetchPrograms(rows: rows, first: first));

    if (response.statusCode == 200) {
      return ProgramEntity.fromJson(response.data);
    } else {
      throw Exception('Failed to load Programs');
    }
  }

  Future<WriterEntity> fetchWriters(
      {required int rows, required int first, required String uuid}) async {
    var dio = await dioFactory.getDio();
    final response =
        await dio.get(HomeRoutes.fetchWriters(rows: rows, first: first, uuid: uuid));

    if (response.statusCode == 200) {
      return WriterEntity.fromJson(response.data);
    } else {
      throw Exception('Failed to load Writers');
    }
  }

  Future<NewsEntity> fetchNews(String uuid, String dataType) async {
    // return Future.delayed(
    //     Durations.extralong4, () => NewsEntity.fromJson(newsJson));

    var dio = await dioFactory.getDio();
    final response =
        await dio.get(HomeRoutes.fetchNews(uuid: uuid, dataType: dataType));

    if (response.statusCode == 200) {
      return NewsEntity.fromJson(response.data);
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<Data> fetchByKeywords(String dataType,
      [List<String>? keywords]) async {
    // return Future.delayed(
    //     Durations.extralong4, () => NewsEntity.fromJson(newsJson));

    var dio = await dioFactory.getDio();
    final response = await dio.get(HomeRoutes.fetchByKeywords(
        dataType: dataType, keywords: keywords ?? []));

    if (response.statusCode == 200) {
      return Data.fromJson(response.data);
    } else {
      throw Exception(
          'Failed to load news by keywords [${(keywords ?? []).join(",")}]');
    }
  }

  Future<SectionDataEntity> fetchCategoryData({
    required String dataType,
    required String category,
    required int rows,
    required int first,
  }) async {
    var dio = await dioFactory.getDio();
    final response = await dio.get(HomeRoutes.fetchCategoryData(
      dataType: dataType,
      category: category,
      rows: rows,
      first: first,
    ));

    if (response.statusCode == 200) {
      return SectionDataEntity.fromJson(response.data);
    } else {
      throw Exception('Failed to load category data [$category]');
    }
  }

  Future<ProgramScheduleEntity> fetchProgramsSchedule() async {
    var dio = await dioFactory.getDio();
    final response = await dio.get(HomeRoutes.fetchProgramsSchedule);

    if (response.statusCode == 200) {
      return ProgramScheduleEntity.fromJson(response.data);
    } else {
      throw Exception('Failed to load programs schedule');
    }
  }

  Future<ProgramPrograms> getProgram(String uuid) async {
    var dio = await dioFactory.getDio();
    final response = await dio.get(HomeRoutes.getProgram(uuid));

    if (response.statusCode == 200) {
      return ProgramPrograms.fromJson(response.data);
    } else {
      throw Exception('Failed to load program [$uuid]');
    }
  }
}
