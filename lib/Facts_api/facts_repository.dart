import 'package:crypto_app/Facts_api/facts.dart';
import 'package:crypto_app/Facts_api/facts_api_provider.dart';
import 'package:crypto_app/news_api/news.dart';
import 'package:crypto_app/news_api/news_api_provider.dart';

class FactsRepository{
  final FactsApiProvider _factsApiProvider = FactsApiProvider();
  Future<List<Facts>> getAllFacts() => _factsApiProvider.getFacts();
}