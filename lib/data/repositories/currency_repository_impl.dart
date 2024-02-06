import 'package:currencies/data/models/storage_currency.dart';
import 'package:currencies/data/providers/api_provider.dart';
import 'package:currencies/domain/currencies_repository.dart';
import 'package:currencies/domain/currency.dart';
import 'package:injectable/injectable.dart';

import '../providers/storage_provider.dart';

@Injectable(as: CurrenciesRepository)
class CurrencyRepositoryImpl implements CurrenciesRepository {
  final APIProvider apiProvider;
  final StorageProvider storageProvider;
  CurrencyRepositoryImpl({required this.apiProvider, required this.storageProvider});

  @override
  Future<List<Currency>> getLatestCurrencies() {
    return apiProvider.fetch().then((res) {
      final (currencies, timestamp) = res;
      // final currencies = res.$1;
      // final timestamp = res.$2;
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

  @override
  void cache(List<Currency> currencies) async {
    final db = await storageProvider.database;
    for(var currency in currencies.map((value) =>
        StorageCurrency(null, value.key, value.name, value.exchange, value.flag, value.timestamp))) {
      db.currencyDao.insertCurrency(currency);
    }
  }

}