import 'package:floor/floor.dart';

@Entity(tableName: StorageCurrency.tableName)
class StorageCurrency {
  static const tableName = "currencies";

  static const currencyTableKey = "currencyKey";
  static const nameTableKey = "name";
  static const exchangeTableKey = "exchange";
  static const flagTableKey = "flag";
  static const timestampTableKey = "timestamp";


  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: currencyTableKey)
  final String currencyKey;

  @ColumnInfo(name: nameTableKey)
  final String name;

  @ColumnInfo(name: exchangeTableKey)
  final double exchange;

  @ColumnInfo(name: flagTableKey)
  final String flag;

  @ColumnInfo(name: timestampTableKey)
  final int timestamp;

  StorageCurrency(this.id, this.currencyKey, this.name, this.exchange, this.flag, this.timestamp);
}