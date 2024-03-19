// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDatabaseProvider {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseProviderBuilder databaseBuilder(String name) =>
      _$DatabaseProviderBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseProviderBuilder inMemoryDatabaseBuilder() =>
      _$DatabaseProviderBuilder(null);
}

class _$DatabaseProviderBuilder {
  _$DatabaseProviderBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DatabaseProviderBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DatabaseProviderBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DatabaseProvider> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DatabaseProvider();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DatabaseProvider extends DatabaseProvider {
  _$DatabaseProvider([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CurrencyDAO? _currencyDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `currencies` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `currencyKey` TEXT NOT NULL, `name` TEXT NOT NULL, `exchange` REAL NOT NULL, `flag` TEXT NOT NULL, `timestamp` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CurrencyDAO get currencyDao {
    return _currencyDaoInstance ??= _$CurrencyDAO(database, changeListener);
  }
}

class _$CurrencyDAO extends CurrencyDAO {
  _$CurrencyDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _storageCurrencyInsertionAdapter = InsertionAdapter(
            database,
            'currencies',
            (StorageCurrency item) => <String, Object?>{
                  'id': item.id,
                  'currencyKey': item.currencyKey,
                  'name': item.name,
                  'exchange': item.exchange,
                  'flag': item.flag,
                  'timestamp': item.timestamp
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<StorageCurrency> _storageCurrencyInsertionAdapter;

  @override
  Future<List<StorageCurrency>> findCurrencies(String currencyKey) async {
    return _queryAdapter.queryList(
        'SELECT * FROM currencies WHERE currencyKey = ?1',
        mapper: (Map<String, Object?> row) => StorageCurrency(
            row['id'] as int?,
            row['currencyKey'] as String,
            row['name'] as String,
            row['exchange'] as double,
            row['flag'] as String,
            row['timestamp'] as int),
        arguments: [currencyKey]);
  }

  @override
  Stream<List<StorageCurrency>> liveCurrenciesStream() {
    return _queryAdapter.queryListStream(
        'SELECT *       FROM currencies        WHERE timestamp >= (         SELECT MAX(timestamp)          FROM currencies c2          WHERE c2.currencyKey = currencies.currencyKey        )         GROUP BY currencyKey ORDER BY timestamp DESC',
        mapper: (Map<String, Object?> row) => StorageCurrency(
            row['id'] as int?,
            row['currencyKey'] as String,
            row['name'] as String,
            row['exchange'] as double,
            row['flag'] as String,
            row['timestamp'] as int),
        queryableName: 'currencies',
        isView: false);
  }

  @override
  Future<void> insertCurrency(StorageCurrency currency) async {
    await _storageCurrencyInsertionAdapter.insert(
        currency, OnConflictStrategy.abort);
  }
}
