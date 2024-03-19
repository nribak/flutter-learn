import 'package:currencies/data/models/storage_currency.dart';
import 'package:floor/floor.dart';

@dao
abstract class CurrencyDAO {

  @insert
  Future<void> insertCurrency(StorageCurrency currency);

  // get all currencies with specific currencyKey
  @Query("SELECT * FROM ${StorageCurrency.tableName} WHERE ${StorageCurrency.currencyTableKey} = :currencyKey")
  Future<List<StorageCurrency>> findCurrencies(String currencyKey);
  
  
  // get live updates of currencies
  @Query(
      """
      SELECT *
      FROM ${StorageCurrency.tableName} 
      WHERE ${StorageCurrency.timestampTableKey} >= (
        SELECT MAX(${StorageCurrency.timestampTableKey}) 
        FROM ${StorageCurrency.tableName} c2 
        WHERE c2.${StorageCurrency.currencyTableKey} = ${StorageCurrency.tableName}.${StorageCurrency.currencyTableKey}
       ) 
       GROUP BY ${StorageCurrency.currencyTableKey} ORDER BY ${StorageCurrency.timestampTableKey} DESC
  """
  )
  Stream<List<StorageCurrency>> liveCurrenciesStream();
}

