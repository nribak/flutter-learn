class Currency {
  final String key;
  final String name;
  final double exchange;
  final String flag;
  final int timestamp;

  Currency({required this.key, required this.name, required this.exchange, required this.flag, required this.timestamp});

  // temp
  static List<Currency> dummyCurrencies = [
    Currency(key: "usd", name: "Dollar", exchange: 1.23, flag: "🇬🇧", timestamp: 0),
    Currency(key: "usd", name: "Dollar", exchange: 1.25, flag: "🇬🇧", timestamp: 1),
  ];
}