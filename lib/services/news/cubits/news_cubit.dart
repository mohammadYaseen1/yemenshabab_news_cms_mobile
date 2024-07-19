import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/news/news.dart';
import 'package:yemenshabab_news_cms_mobile/services/news/service/new_service.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsService newsService;

  NewsCubit({required this.newsService}) : super(NewsInitial());

  Future<void> fetchNews() async {
    try {
      emit(NewsLoading());
      final news = await newsService.fetchNews();
      emit(NewsLoaded(news));
    } catch (e) {
      emit(NewsError('Failed to fetch news'));
    }
  }
}
