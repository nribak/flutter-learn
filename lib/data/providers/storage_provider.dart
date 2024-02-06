import 'dart:async';

import 'package:currencies/data/dao/currency_dao.dart';
import 'package:currencies/data/models/storage_currency.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'storage_provider.g.dart'; // the generated code will be there


class StorageProvider {
  final Future<DatabaseProvider> database;

  StorageProvider({required this.database});
}

@Database(version: 1, entities: [StorageCurrency])
abstract class DatabaseProvider extends FloorDatabase {

  CurrencyDAO get currencyDao;

}