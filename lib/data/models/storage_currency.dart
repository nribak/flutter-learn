import 'package:floor/floor.dart';

@Entity(tableName: StorageCurrency.tableName)
class StorageCurrency {
  static const tableName = "currencies";

  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String key;
  final String name;
  final double exchange;
  final String flag;
  final int timestamp;

  StorageCurrency(this.id, this.key, this.name, this.exchange, this.flag, this.timestamp);
}