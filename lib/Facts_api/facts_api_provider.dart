import 'dart:convert';
import 'package:crypto_app/Facts_api/facts.dart';
import 'package:crypto_app/Facts_api/facts_list_model.dart';
import 'package:http/http.dart' as http;



class FactsApiProvider{
  static const _key = 'a8fb3bd1042c4c31a4241ec461192539';
  Future<List<Facts>> getFacts() async{
    final responce = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=facts-crypto&apiKey=a8fb3bd1042c4c31a4241ec461192539'));
    if (responce.statusCode == 200){
      String data = responce.body;
      var jsonData = jsonDecode(data);
      FactListModel articles = FactListModel.fromMap(jsonData);
      List<Facts> factsListModel =
      articles.facts!.map((e) => Facts.fromMap(e)).toList();
      return factsListModel;
    } else{
      throw Exception('Error');
    }
  }
}