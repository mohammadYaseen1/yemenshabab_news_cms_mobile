import 'package:yemenshabab_news_cms_mobile/data/models/home/indicator/Indicator_model.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/news_model.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/program/program_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/section/section_entity.dart';

class HomeModel {
  HomeModel({
    List<IndicatorModel>? indicator,
    List<NewsModel>? news,
    ProgramEntity? program,
    List<SectionSections>? section,
  }) {
    _indicator = indicator;
    _news = news;
    _program = program;
    _section = section;
  }

  List<IndicatorModel>? _indicator;
  List<NewsModel>? _news;
  ProgramEntity? _program;
  List<SectionSections>? _section;

  List<IndicatorModel> get indicator => _indicator ?? [];

  List<NewsModel> get news => _news ?? [];

  ProgramEntity get program => _program!;
  List<SectionSections> get section => _section ?? [];

  set program(ProgramEntity value) {
    _program = value;
  }

  set section(List<SectionSections> value) {
    _section = value;
  }
}
