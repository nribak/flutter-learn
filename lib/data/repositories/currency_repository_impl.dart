import 'dart:async';

import 'package:currencies/data/models/storage_currency.dart';
import 'package:currencies/data/providers/api_provider.dart';
import 'package:currencies/domain/currencies_repository.dart';
import 'package:currencies/domain/currency.dart';
import 'package:injectable/injectable.dart';

import '../providers/storage_provider.dart';

@LazySingleton(as: CurrenciesRepository)
class CurrencyRepositoryImpl implements CurrenciesRepository {
  final APIProvider apiProvider;
  final StorageProvider storageProvider;
  CurrencyRepositoryImpl({required this.apiProvider, required this.storageProvider});

  List<Currency> convert(List<StorageCurrency> list) =>
      list.map((storageCurrency) => Currency(
          key: storageCurrency.currencyKey,
          name: storageCurrency.name,
          exchange: storageCurrency.exchange,
          flag: storageCurrency.flag,
          timestamp: storageCurrency.timestamp
      )).toList();


  @override
  Future<List<Currency>> getLatestCurrencies() {
    return apiProvider.fetch().then((res) {
      final (currencies, timestamp) = res;
      final items = currencies.map((remoteCurrency) =>
          Currency(
              key: remoteCurrency.key,
              name: remoteCurrency.name,
              exchange: remoteCurrency.exchange,
              flag: remoteCurrency.flag,
              timestamp: timestamp
          )).toList();
      // cache(items);
      return items;
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

  @override
  Future<List<Currency>> getCurrenciesBy(String key) async {
    final db = await storageProvider.database;
    final list = await db.currencyDao.findCurrencies(key);
    return list.map((el) =>
        Currency(
            key: el.currencyKey,
            name: el.name,
            exchange: el.exchange,
            flag: el.flag,
            timestamp: el.timestamp
        )).toList();
  }

  @override
  Stream<List<Currency>> liveCurrencyStream() {
    final controller = StreamController<List<Currency>>();
    storageProvider.database.then((db) {
      final stream = db.currencyDao.liveCurrenciesStream();
      final outStream = stream.map(convert);
      controller.sink.addStream(outStream);
    });
    return controller.stream;
  }

}