import 'package:currencies/data/models/storage_currency.dart';
import 'package:floor/floor.dart';

@dao
abstract class CurrencyDAO {

  @insert
  Future<void> insertCurrency(StorageCurrency currency);

  // get all currencies with specific currencyKey
  @Query("SELECT * FROM ${StorageCurrency.tableName} WHERE currencyKey = :currencyKey")
  Future<List<StorageCurrency>> findCurrencies(String currencyKey);
}