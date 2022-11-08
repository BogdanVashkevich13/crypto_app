import 'package:crypto_app/news_api/news.dart';
import 'package:crypto_app/news_api/news_api_provider.dart';

class NewsRepository{
  final NewsApiProvider _newsApiProvider = NewsApiProvider();
  Future<List<News>> getAllNews() => _newsApiProvider.getNews();
}