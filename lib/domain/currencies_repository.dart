import 'package:currencies/domain/currency.dart';

abstract class CurrenciesRepository {

  Future<List<Currency>> getLatestCurrencies();

}