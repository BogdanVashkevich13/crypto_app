import 'dart:convert';

import 'package:crypto_app/news_api/news.dart';
import 'package:crypto_app/news_api/news_list_model.dart';
import 'package:http/http.dart' as http;



class NewsApiProvider{
  static const _key = 'a8fb3bd1042c4c31a4241ec461192539';
  Future<List<News>> getNews() async{
    final responce = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=bitcoin&apiKey=a8fb3bd1042c4c31a4241ec461192539'));
    if (responce.statusCode == 200){
      String data = responce.body;
      var jsonData = jsonDecode(data);
      ArticlesListModel articles = ArticlesListModel.fromMap(jsonData);
      List<News> articlesListModel =
      articles.articles!.map((e) => News.fromMap(e)).toList();
      return articlesListModel;
    } else{
      throw Exception('Error');
    }
  }
}

// final List<dynamic> newsJson = json.decode(responce.body);
// return newsJson.map((json) => News.fromJson(json)).toList();


// String data = responce.body;
// var jsonData = jsonDecode(data);
// News articles = News.fromMap(jsonData);
// List<News> newsListModel =
// articles.news!.map((e) => News.fromMap(e)).toList();
// return newsListModel;