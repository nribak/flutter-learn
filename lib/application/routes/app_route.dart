import 'package:currencies/application/screens/history_screen.dart';
import 'package:currencies/application/widgets/app.dart';
import 'package:flutter/widgets.dart';

sealed class AppRoute {
  abstract final String name;
  abstract final WidgetBuilder builder;
}

final class HomeRoute extends AppRoute {
  @override
  WidgetBuilder get builder => (context) => App();

  @override
  String get name => "/";
}

final class HistoryRoute extends AppRoute {
  final String currencyKey;

  HistoryRoute({required this.currencyKey});

  @override
  WidgetBuilder get builder => (context) => HistoryScreen(currencyKey: currencyKey);

  @override
  String get name => "/history/$currencyKey";

}