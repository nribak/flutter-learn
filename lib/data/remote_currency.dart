class RemoteCurrency {
  final String key;
  final String name;
  final double exchange;
  final String flag;

  RemoteCurrency({required this.key, required this.name, required this.exchange, required this.flag});

  factory RemoteCurrency.fromMap(Map<String, dynamic> map) =>
      RemoteCurrency(
          key: map['key'],
          name: map['name'],
          exchange: map['exchange'],
          flag: map['flag']
      );

}