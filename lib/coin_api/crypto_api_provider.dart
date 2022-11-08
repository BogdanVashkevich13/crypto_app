import 'dart:convert';

import 'package:http/http.dart' as http;

import 'currency.dart';

class CoinApiProvider{
  static const _key = '774bf470-fd0c-4b72-bccd-e3c46e71eed9';
Future<List<Coins>> getCoins() async{
  final responce = await http.get(Uri.parse('https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=100&sort=market_cap&cryptocurrency_type=all&tag=all'));
  if (responce.statusCode == 200){
    final List<dynamic> coinJson = json.decode(responce.body);
    return coinJson.map((json) => Coins.fromJson(json)).toList();
  } else{
    throw Exception('Eror');
  }
}
}

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