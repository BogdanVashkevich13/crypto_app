import 'dart:convert';
import 'package:crypto_app/Facts_api/facts.dart';
import 'package:http/http.dart' as http;



class FactsApiProvider{
  static const _key = 'a8fb3bd1042c4c31a4241ec461192539';
  Future<List<Facts>> getFacts() async{
    final responce = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=facts-crypto&apiKey=a8fb3bd1042c4c31a4241ec461192539'));
    if (responce.statusCode == 200){
      final List<dynamic> factsJson = json.decode(responce.body);
      return factsJson.map((json) => Facts.fromJson(json)).toList();
    } else{
      throw Exception('Error');
    }
  }
}