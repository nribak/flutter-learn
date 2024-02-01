import 'package:currencies/data/api_provider.dart';
import 'package:currencies/domain/currencies_repository.dart';
import 'package:currencies/domain/currency.dart';

class CurrencyRepositoryImpl implements CurrenciesRepository {
  final APIProvider apiProvider;

  CurrencyRepositoryImpl({required this.apiProvider});

  @override
  Future<List<Currency>> getLatestCurrencies() {
    return apiProvider.fetch().then((res) {
      final currencies = res.$1;
      final timestamp = res.$2;
      return currencies.map((remoteCurrency) =>
          Currency(
              key: remoteCurrency.key,
              name: remoteCurrency.name,
              exchange: remoteCurrency.exchange,
              flag: remoteCurrency.flag,
              timestamp: timestamp
          )).toList();
    });
  }

}