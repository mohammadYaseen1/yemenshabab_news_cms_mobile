import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/core/utils/utils.dart';
import 'package:yemenshabab/data/models/home/home_model.dart';
import 'package:yemenshabab/data/models/home/indicator/Indicator_model.dart';
import 'package:yemenshabab/data/models/home/news/data.dart';
import 'package:yemenshabab/data/models/home/news/news_model.dart';
import 'package:yemenshabab/data/models/home/news/news_type.dart';
import 'package:yemenshabab/data/models/playlist_entity.dart';
import 'package:yemenshabab/data/models/program_schedule.dart';
import 'package:yemenshabab/data/models/program_schedule_entity.dart';
import 'package:yemenshabab/data/models/search_entity.dart';
import 'package:yemenshabab/data/models/section/section_data_entity.dart';
import 'package:yemenshabab/data/models/writer_entity.dart';
import 'package:yemenshabab/services/home/models/landing/data.dart';
import 'package:yemenshabab/services/home/models/landing/item.dart';
import 'package:yemenshabab/services/home/models/landing/landing.dart';
import 'package:yemenshabab/services/home/models/landing/layout.dart';
import 'package:yemenshabab/services/home/models/news/news_entity.dart';
import 'package:yemenshabab/services/home/models/program/program_entity.dart';
import 'package:yemenshabab/services/home/models/section/section_entity.dart';
import 'package:yemenshabab/services/home/repositories/home_repository.dart';
import 'package:yemenshabab/shared/days.dart';

class HomeService {
  final HomeRepository homeRepository;

  HomeService({required this.homeRepository});

  Future<HomeModel> fetchLanding(String language) async {
    Landing landing = await homeRepository.fetchLanding(language);
    List<LayoutData> layouts = sortLayout(landing);
    return HomeModel(
      indicator: getIndicator(layouts, language),
      news: getNews(layouts, language),
    );
  }

  List<LayoutData> sortLayout(Landing landing) {
    var layouts = landing.layouts!;
    layouts.sort((a, b) => int.parse(a.order!).compareTo(int.parse(b.order!)));
    return layouts;
  }

  List<NewsModel> getNews(List<LayoutData> layouts, String language) {
    var news = layouts.skip(1);
    return [
      ...news
          .where((value) =>
              value.main != null && (value.main!.items ?? []).isNotEmpty)
          .map((e) => buildNewsModel(e.main!, language)),
      ...news
          .where((value) =>
              value.side != null && (value.side!.items ?? []).isNotEmpty)
          .map((e) => buildNewsModel(e.side!, language))
    ];
  }

  NewsModel buildNewsModel(Data data, String language) => NewsModel(
        title: language == "ar" ? data.headerAr : data.header,
        type: handleDataType(data),
        name: data.header,
        data: (data.items ?? [])
            .where((item) => !isFutureDate(item.date ?? ""))
            .map((item) {
          return buildDataModel(item, handleDataType(data), language);
        }).toList(),
      );

  ViewType handleDataType(Data data) {
    var dataType = ViewType.valueOf(data.dataType);
    if (adsLayouts.contains(data.name)) {
      dataType = ViewType.valueOf(data.name);
    }
    return dataType;
  }

  DataModel buildDataModel(Item item, ViewType dataType, String language) {
    var dataModel = DataModel(
        image: item.image,
        title: item.title,
        subTitle: item.subtitle,
        tag: item.category,
        uuid: item.uuid,
        dataType: dataType,
        time: getFormattedDate(item.date!, language),
        color: parseColorString(item.categoryColor!));
    return dataModel;
  }

  List<IndicatorModel> getIndicator(List<LayoutData> layouts, String language) {
    var main = layouts.first.main ?? Data();
    var side = layouts.first.side ?? Data();
    var mainSize = main.items?.length ?? 0;
    return [
      ...buildIndicators(main, 4, language),
      if (mainSize < 4) ...buildIndicators(side, 4, language),
    ];
  }

  List<IndicatorModel> buildIndicators(Data data, int size, String language) =>
      List.generate(
          lengthOfData(data, size),
          (index) => IndicatorModel(
                uuid: data.items![index].uuid,
                image: data.items![index].image,
                title: data.items![index].title,
                tag: data.items![index].category,
                source: data.items![index].subtitle,
                time: getDurationString(data.items![index].date!, language),
                color: parseColorString(data.items![index].categoryColor!),
                dataType: data.dataType,
              ));

  int lengthOfData(Data data, int size) {
    var length = data.items?.length ?? 0;
    return length >= size ? size : length;
  }

  Future<SectionEntity> fetchSections() async {
    return await homeRepository.fetchSections();
  }

  Future<ProgramEntity> fetchPrograms({int rows = 10, int first = 0}) async {
    return await homeRepository.fetchPrograms(rows: rows, first: first);
  }

  Future<WriterEntity> fetchWriters(
      {required String uuid, int rows = 10, int first = 0}) async {
    return await homeRepository.fetchWriters(
        uuid: uuid, rows: rows, first: first);
  }

  Future<ProgramPrograms> getProgram(String uuid) async {
    return await homeRepository.getProgram(uuid);
  }

  Future<ProgramSchedule> fetchProgramsSchedule() async {
    var programsSchedule = ProgramSchedule();
    var programScheduleEntity = await homeRepository.fetchProgramsSchedule();
    programScheduleEntity.sortPrograms();
    for (var program in programScheduleEntity.programs!) {
      List<Days> days = extractDays(program);
      for (var day in days) {
        programsSchedule.put(day, program);
      }
    }
    return programsSchedule;
  }

  List<Days> extractDays(ProgramSchedulePrograms program) {
    var releaseDays = program.releaseDays ?? "";
    return releaseDays.split(',').map(Days.valueOf).toList();
  }

  Future<NewsEntity> fetchNews(String uuid, String dataType) async {
    return await homeRepository.fetchNews(uuid, dataType);
  }

  Future<PlaylistEntity> fetchPlaylist(String id, int count) async {
    return await homeRepository.fetchPlaylist(id, count);
  }

  Future<Data> fetchNewsByKeywords(String dataType,
      [List<String>? keywords]) async {
    return await homeRepository.fetchByKeywords(dataType, keywords);
  }

  Future<SectionDataEntity> fetchCategoryData({
    required String dataType,
    required String category,
    int rows = 10,
    int first = 0,
  }) async {
    return await homeRepository.fetchCategoryData(
      dataType: dataType,
      category: category,
      rows: rows,
      first: first,
    );
  }

  Future<SearchEntity> search({
    required String searchTarget,
    int rows = 10,
    int first = 0,
  }) async {
    return await homeRepository.search(
      searchTarget: searchTarget,
      rows: rows,
      first: first,
    );
  }
}
