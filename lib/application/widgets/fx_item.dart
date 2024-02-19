import 'package:currencies/di/injector.dart';
import 'package:currencies/domain/currency.dart';
import 'package:flutter/material.dart';

class FXItem extends StatelessWidget {
  final Currency currency;

  const FXItem({super.key, required this.currency});

  void _handleTap() {
    //TODO: temp! remove later
    final repo = Resolver.instance().currenciesRepositories;
    repo.getCurrenciesBy(currency.key)
        .then((list) {
          print(list.map((el) => "${el.timestamp}: ${el.exchange}"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _handleTap(),
        title: Text(currency.name),
        subtitle: Text(currency.exchange.toStringAsFixed(3)),
        leading: Text(currency.flag)
    );
  }
}