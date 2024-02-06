import 'package:currencies/data/models/remote_currency.dart';

abstract interface class APIProvider {

  Future<(List<RemoteCurrency> currencies, int timestamp)> fetch();
}