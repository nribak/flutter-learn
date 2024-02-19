import 'package:injectable/injectable.dart';

import '../database/app_database.dart';

@LazySingleton()
class StorageProvider {
  final Future<DatabaseProvider> database;

  StorageProvider({required this.database});

  @FactoryMethod()
  static StorageProvider create() {
    final db = $FloorDatabaseProvider.databaseBuilder('app_database.db').build();
    return StorageProvider(database: db);
  }

}