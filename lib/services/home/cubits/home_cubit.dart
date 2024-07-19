import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/bottom_nav_model.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/data_type.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/home_model.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/news_type.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/program_schedule.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/section/category.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/section/section_data_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/program/program_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/section/section_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/service/home_service.dart';
import 'package:yemenshabab_news_cms_mobile/shared/constants/constants.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/home_page.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/program_schedule_page.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/programs_page.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/tab_screen.dart';
import 'package:yemenshabab_news_cms_mobile/views/settings_page.dart';

part 'home_state.dart';

class SectionDate {
  SectionDate({
    required this.index,
    required this.section,
    required this.tab,
    this.data,
  });

  final int index;

  final SectionSections section;
  final Widget Function(int?) tab;
  SectionSectionsCategories? data;
}

class HomeCubit extends Cubit<HomeState> {
  final HomeService homeService;

  HomeCubit({required this.homeService}) : super(HomeInitial());
  var activeIndex = 0;

  List<SectionDate> allSections = [];
  List<CategorySection> section = [];

  List<SectionSections> sectionCategory = [];
  List<CategorySection> videoSection = [];
  Map<String, SectionDataEntity> categoryDataMap = {};
  int categoryIndex = 0;

  Future<void> fetchAll(String language) async {
    try {
      emit(LandingLoading());
      final homeModel = await fetchLanding(language);
      final program = await homeService.fetchPrograms();
      final section = await homeService.fetchSections();
      programEntity = program;
      fillCategorySection(section);
      homeModel.program = program;
      isLoadedLanding = true;
      homeModelConst = homeModel;
      emit(LandingLoaded(homeModel));
    } catch (e) {
      emit(LandingError('Failed to fetch landing', e.toString()));
    }
  }

  Future<HomeModel> fetchLanding(String language, [bool all = true]) async {
    try {
      if (!all) emit(LandingLoading());
      final homeModel = await homeService.fetchLanding(language);
      homeModel.program = homeModelConst?.program ??
          ProgramEntity.fromJson({'programs': [], 'totalRecords': 0});
      isLoadedLanding = true;
      homeModelConst = homeModel;
      if (!all) emit(LandingLoaded(homeModel));
      return Future.value(homeModel);
    } catch (e) {
      emit(LandingError('Failed to fetch landing', e.toString()));
      return Future.error(e);
    }
  }

  void fillCategorySection(SectionEntity section) {
    (section.sections ?? []).sort((a, b) => a.order!.compareTo(b.order!));
    sectionCategory = section.sections ?? [];
    int index = 1;
    for (var section in (section.sections ?? <SectionSections>[])) {
      if('PROGRAM' != section.dataType) {
        allSections.add(SectionDate(
          index: index++,
          section: section,
          tab: (i) {
            return TabScreen(
              categoryData: section.categories!.map((cat) {
                return CategorySection(
                  dataType: ViewType.valueOf(section.dataType!),
                  color: cat.color,
                  layout: Layout.valueOf(cat.layout!),
                  nameAr: cat.nameAr,
                  nameEn: cat.nameEn,
                );
              }).toList(),
              index: i,
              videoSection: videoSection,
            );
          },
        ));
      }
    }
    for (var sec in section.sections ?? []) {
      if ('VIDEO' == sec.dataType) {
        sec.categories?.forEach((category) => videoSection.add(CategorySection(
              dataType: ViewType.valueOf(sec.dataType!),
              color: category.color,
              layout: Layout.valueOf(category.layout!),
              nameAr: category.nameAr,
              nameEn: category.nameEn,
            )));
        this.section.add(CategorySection(
              layout: Layout.GRID,
              dataType: ViewType.valueOf(sec.dataType!),
              nameAr: sec.nameAr,
              nameEn: sec.nameEn,
            ));
      } else if ('PROGRAM' != sec.dataType) {
        sec.categories?.forEach((category) => this.section.add(CategorySection(
              dataType: ViewType.valueOf(sec.dataType!),
              color: category.color,
              layout: Layout.valueOf(category.layout!),
              nameAr: category.nameAr,
              nameEn: category.nameEn,
            )));
      }
    }
  }

  Future<void> fetchPrograms() async {
    try {
      emit(ProgramsLoading());
      final program = await homeService.fetchPrograms();
      programEntity = program;
      emit(ProgramsLoaded(program));
    } catch (e) {
      emit(ProgramsError('Failed to fetch programs'));
    }
  }

  Future<void> fetchProgramsSchedule() async {
    try {
      emit(ProgramsScheduleLoading());
      final program = await homeService.fetchProgramsSchedule();
      emit(ProgramsScheduleLoaded(program));
    } catch (e) {
      emit(ProgramsScheduleError('Failed to fetch programs schedule'));
    }
  }

  Future<void> fetchSections() async {
    try {
      emit(SectionsLoading());
      final section = await homeService.fetchSections();
      fillCategorySection(section);
      emit(SectionsLoaded());
    } catch (e) {
      emit(SectionsError('Failed to fetch home'));
    }
  }

  Future<void> fetchCategoryData({
    required String dataType,
    required String category,
    int rows = 10,
    int first = 0,
    bool refresh = false,
  }) async {
    try {
      if (!refresh && categoryDataMap.containsKey(category))
        return emit(CategoryDataLoaded());
      emit(CategoryDataLoading());
      final categoryData = await homeService.fetchCategoryData(
        dataType: dataType,
        category: category,
        rows: rows,
        first: first,
      );
      categoryDataMap[category] = categoryData;
      emit(CategoryDataLoaded());
    } catch (e) {
      emit(CategoryDataError(
          'Failed to fetch category [$category]', e.toString()));
    }
  }

  List<BottomNavModel> bottomNavData(BuildContext context) => [
        BottomNavModel(
          icon: Icons.home_filled,
          title: AppLocalizations.of(context)!.home,
          screen: ([data]) => HomePage(homeModel: data as HomeModel),
        ),
        BottomNavModel(
          icon: Icons.video_collection_rounded,
          title: AppLocalizations.of(context)!.programs,
          screen: ([data]) => ProgramPage(program: (data as HomeModel).program),
        ),
        BottomNavModel(
          icon: Icons.ondemand_video_rounded,
          title: AppLocalizations.of(context)!.programsSchedule,
          screen: ([data]) => ProgramSchedulePage(),
        ),
        BottomNavModel(
          icon: Icons.settings_rounded,
          title: AppLocalizations.of(context)!.settings,
          screen: ([data]) => SettingsPage(),
        ),
      ];

  void select(int index) {
    activeIndex = index;
    emit(
        ChangeBottomNavState(index: index, widget: NavBarWidget.values[index]));
  }
}

enum NavBarWidget { home, programs, myList, profile }
