import 'package:floor/floor.dart';

@Entity(tableName: StorageCurrency.tableName)
class StorageCurrency {
  static const tableName = "currencies";

  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String currencyKey;
  final String name;
  final double exchange;
  final String flag;
  final int timestamp;

  StorageCurrency(this.id, this.currencyKey, this.name, this.exchange, this.flag, this.timestamp);
}