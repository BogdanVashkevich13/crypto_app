import 'package:bloc/bloc.dart';
import 'package:crypto_app/news_api/news_api_provider.dart';
import 'package:flutter/cupertino.dart';
import '../news_api/news.dart';
import '../news_api/news_repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState>{
  final NewsRepository newsRepository;
  NewsBloc(this.newsRepository): super(NewsLoadingState()){
    _loadNews();
    on<NewsLoadEvent>((event, emit) async {
      emit(NewsLoadingState());
      _loadNews();
    });
  }
  Future<void> _loadNews() async {
    try{
      final List<News> loadedNewsList = await newsRepository.getAllNews();
      emit(NewsLoadedState(loadedNews: loadedNewsList));
    } catch (_){
      emit(NewsErorState());
    }
  }
}
// on<NewsLoadEvent>((event, emit) async {
// emit(NewsLoadingState());
// try{
// final List<News> loadedNewsList = await newsRepository.getAllNews();
// emit(NewsLoadedState(loadedNews: loadedNewsList));
// } catch (_){
// emit (NewsErorState());
// }
// });