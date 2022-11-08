import 'package:crypto_app/news_api/news.dart';


abstract class NewsState {}

class NewsEmptyState extends NewsState {}
class NewsLoadingState extends NewsState {}
class NewsLoadedState extends NewsState {
  List<News> loadedNews;
  NewsLoadedState({
    required this.loadedNews,
  });
}
class NewsErorState extends NewsState {}