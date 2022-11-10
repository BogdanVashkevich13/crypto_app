class CoinListModel {
  List<dynamic>? coins;
  CoinListModel({
    this.coins,
  });

  factory CoinListModel.fromMap(Map<String, dynamic> map) {
    return CoinListModel(coins: map['articles']);
  }
}