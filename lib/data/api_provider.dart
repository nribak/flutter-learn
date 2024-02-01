import 'package:currencies/data/remote_currency.dart';

abstract class APIProvider {

  Future<(List<RemoteCurrency> currencies, int timestamp)> fetch();
}