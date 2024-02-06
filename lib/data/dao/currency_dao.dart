import 'package:currencies/data/models/storage_currency.dart';
import 'package:floor/floor.dart';

@dao
abstract class CurrencyDAO {

  @insert
  Future<void> insertCurrency(StorageCurrency currency);
}