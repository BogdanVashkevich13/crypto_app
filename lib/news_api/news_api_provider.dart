import 'dart:convert';

import 'package:crypto_app/news_api/news.dart';
import 'package:http/http.dart' as http;



class NewsApiProvider{
  static const _key = 'a8fb3bd1042c4c31a4241ec461192539';
  Future<List<News>> getNews() async{
    final responce = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=bitcoin&apiKey=a8fb3bd1042c4c31a4241ec461192539'));
    if (responce.statusCode == 200){
      final List<dynamic> newsJson = json.decode(responce.body);
      return newsJson.map((json) => News.fromJson(json)).toList();
    } else{
      throw Exception('Eror');
    }
  }
}