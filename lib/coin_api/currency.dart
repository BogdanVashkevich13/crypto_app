class Coins {
  final String id;
  final String name;
  final String symbol;
  final double price;
  final int cmc_rank;
  final double percent_change_1h;
  final double percent_change_24h;
  final double percent_change_7d;

  const Coins({
    required this.id,
    required this.name,
    required this.price,
    required this.symbol,
    required this.cmc_rank,
    required this.percent_change_1h,
    required this.percent_change_24h,
    required this.percent_change_7d,
  });

  Coins.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = double.parse(json['price']),
        symbol = json['symbol'],
        cmc_rank = int.parse(json['cmc_ranc']),
        percent_change_1h = double.parse(json['percent_change_1h']),
        percent_change_7d = double.parse(json['percent_change_7d']),
        percent_change_24h = double.parse(json['percent_change_24h']);
}
