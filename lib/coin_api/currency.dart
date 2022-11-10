class Coins {
  final String id;
  final String logoUrl;
  final String name;
  final double price;
  final double oneHourChange;
  final double oneDayChange;
  final double marketCap;
  final int rank;
  final int rankDelta;

  const Coins({
    required this.id,
    required this.name,
    required this.price,
    required this.logoUrl,
    required this.oneHourChange,
    required this.oneDayChange,
    required this.marketCap,
    required this.rank,
    required this.rankDelta,
  });

  Coins.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.name = json['name'],
        this.price = double.parse(json['price']),
        this.logoUrl = json['logo_url'],
        this.oneHourChange = double.parse(json['1h']['price_change_pct']),
        this.oneDayChange = double.parse(json['1d']['price_change_pct']),
        this.marketCap = double.parse(json['market_cap']),
        this.rank = int.parse(json['rank']),
        this.rankDelta = int.parse(json['rank_delta']);
}
