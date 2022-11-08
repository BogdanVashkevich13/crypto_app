import '../coin_api/currency.dart';

abstract class CoinState {}

//class CoinEmptyState extends CoinState {}
class CoinLoadingState extends CoinState {}
class CoinLoadedState extends CoinState {
  List<Coins> loadedCoin;
  CoinLoadedState({
    required this.loadedCoin,
});
}
class CoinErorState extends CoinState {}