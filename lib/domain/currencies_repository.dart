import 'package:currencies/domain/currency.dart';

abstract interface class CurrenciesRepository {

  Future<List<Currency>> getLatestCurrencies();

  void cache(List<Currency> currencies);

  Future<List<Currency>> getCurrenciesBy(String key);
}