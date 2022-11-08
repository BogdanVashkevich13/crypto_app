import 'package:crypto_app/coin_api/crypto_api_provider.dart';
import 'package:crypto_app/coin_api/currency.dart';

class CoinRepository{
 final CoinApiProvider _coinApiProvider = CoinApiProvider();
   Future<List<Coins>>    getAllCoins() => _coinApiProvider.getCoins();
}