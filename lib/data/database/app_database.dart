import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../models/storage_currency.dart';
import 'dao/currency_dao.dart';

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [StorageCurrency])
abstract class DatabaseProvider extends FloorDatabase {

  CurrencyDAO get currencyDao;
}