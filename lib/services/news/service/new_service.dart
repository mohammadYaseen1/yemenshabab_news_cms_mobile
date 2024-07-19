import 'package:yemenshabab_news_cms_mobile/data/models/news/news.dart';
import 'package:yemenshabab_news_cms_mobile/services/news/repositories/news_repository.dart';

class NewsService {
  final NewsRepository newsRepository;

  NewsService({required this.newsRepository});

  Future<List<News>> fetchNews() async {
    return await newsRepository.fetchNews();
  }
}