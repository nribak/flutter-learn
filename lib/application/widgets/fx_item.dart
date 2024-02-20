import 'package:currencies/application/routes/app_route.dart';
import 'package:currencies/application/routes/app_route_mixin.dart';
import 'package:currencies/domain/currency.dart';
import 'package:flutter/material.dart';

class FXItem extends StatelessWidget with AppRouteMixin {
  final Currency currency;

  const FXItem({super.key, required this.currency});

  void _handleTap(BuildContext context) {
    navigate(context, HistoryRoute(currencyKey: currency.key));
    // Navigator
    //     .pushNamed(
    //     context, "/history",
    //     arguments: currency.key
    // );
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //       builder: (context) => HistoryScreen(currencyKey: currency.key)
    //   )
    // );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _handleTap(context),
        title: Text(currency.name),
        subtitle: Text(currency.exchange.toStringAsFixed(3)),
        leading: Text(currency.flag)
    );
  }
}