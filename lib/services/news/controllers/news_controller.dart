import 'package:yemenshabab/services/news/cubits/news_cubit.dart';
import 'package:yemenshabab/services/news/service/new_service.dart';

import '../repositories/news_repository.dart';

class NewsController {
  final NewsCubit newsCubit;

  NewsController()
      : newsCubit = NewsCubit(
          newsService: NewsService(newsRepository: NewsRepository()),
        );

  void fetchNews() {
    newsCubit.fetchNews();
  }
}
