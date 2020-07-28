import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('Global')
class GlobalModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get newConfirmed => integer()();
  IntColumn get totalConfirmed => integer()();
  IntColumn get newDeaths => integer()();
  IntColumn get totalDeaths => integer()();
  IntColumn get newRecovered => integer()();
  IntColumn get totalRecovered => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
