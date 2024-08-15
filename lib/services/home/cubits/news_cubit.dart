import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yemenshabab/data/models/home/news/news_type.dart';
import 'package:yemenshabab/services/home/models/landing/data.dart';
import 'package:yemenshabab/services/home/models/news/news_entity.dart';
import 'package:yemenshabab/services/home/service/home_service.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final HomeService homeService;

  NewsCubit({required this.homeService}) : super(NewsInitial());

  bool isLoadedNews = false;

  Future<void> getNews(String uuid, ViewType dataType) async {
    try {
      emit(NewsLoading());
      final news = await homeService.fetchNews(uuid, dataType.name);
      var keywards = news.keywords?.ar ?? [];
      if (keywards.length > 1) {
        keywards.removeWhere((element) => element.contains('يمن'));
      }
      final data = news.keywords != null
          ? await fetchNewsByKeywords(dataType.name, keywards)
          : null;
      emit(NewsLoaded(news, data));
      isLoadedNews = true;
    } catch (e) {
      emit(NewsError('Failed to fetch news'));
    }
  }

  Future<void> getNewsByKeywords(String dataType,
      [List<String>? keywords]) async {
    try {
      emit(NewsByKeywordsLoading());
      final news = await homeService.fetchNewsByKeywords(dataType, keywords);
      emit(NewsByKeywordsLoaded(news));
    } catch (e) {
      emit(NewsByKeywordsError('Failed to fetch news by keywords'));
    }
  }

  Future<Data?> fetchNewsByKeywords(String dataType,
      [List<String>? keywords]) async {
    try {
      final news = await homeService.fetchNewsByKeywords(dataType, keywords);
      return news;
    } catch (e) {
      return null;
    }
  }
}
