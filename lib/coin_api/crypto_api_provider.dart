import 'dart:convert';

import 'package:crypto_app/coin_api/coin_list_model.dart';
import 'package:http/http.dart' as http;

import 'currency.dart';

class CoinApiProvider {
  static final _key = '774bf470-fd0c-4b72-bccd-e3c46e71eed9';


  static Future<List<Coins>> getCoins() async {
    final url =
        'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';
    final responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      final List<dynamic> cryptoJson = json.decode(responce.body);
      return cryptoJson.map((json) => Coins.fromJson(json)).toList();
    } else {
      throw Exception('Error to Load internet');
    }
  }
}

//   static Future<List<Coins>> getCoins() async {
//     final responce = await http.get(Uri.parse(
//         'https://api.nomics.com/v1/currencies/ticker?key=$_key&ids=BTC,ETH,XRP&interval=1d,30d&convert=EUR&platform-currency=ETH&per-page=100&page=1'));
//     final List<dynamic> coinJson = json.decode(responce.body);
//     return coinJson.map((json) => Coins.fromJson(json)).toList();
//   }
// }
// if (responce.statusCode == 200){
// if (responce.statusCode == 200){
// String data = responce.body;
// var jsonData = jsonDecode(data);
// CoinListModel articles = CoinListModel.fromMap(jsonData);
// List<Coins> factsListModel =
// articles.coins!.map((e) => Coins.fromMap(e)).toList();
// return factsListModel;

// final List<dynamic> coinJson = json.decode(responce.body);
// return coinJson.map((item) => Coins.fromJson(item)).toList();

// final List<dynamic> coinJson = json.decode(responce.body);
// return coinJson.map((json) => Coins.fromJson(json)).toList();


// class CoinApiProvider {
//   static const _key = '774bf470-fd0c-4b72-bccd-e3c46e71eed9';
//
//   static Future<List<Coins>> getCoins() async {
//     final url =
//         'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';
//     final responce = await http.get(Uri.parse(url));
//     if (responce.statusCode == 200){
//       final List<dynamic> cryptoJson = json.decode(responce.body);
//       return cryptoJson.map((json) => Coins.fromJson(json)).toList();
//     } else{
//       throw Exception('Error to Load internet');
//     }