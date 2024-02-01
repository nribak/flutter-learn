import 'package:currencies/domain/currency.dart';
import 'package:flutter/material.dart';

class FXItem extends StatelessWidget {
  final Currency currency;

  const FXItem({super.key, required this.currency});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(currency.name),
        subtitle: Text(currency.exchange.toStringAsFixed(3)),
        leading: Text(currency.flag)
    );
  }
}