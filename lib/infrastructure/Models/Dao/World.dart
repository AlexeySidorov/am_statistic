import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('World')
class WorldModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get countryId => integer()();
  IntColumn get confirmed => integer()();
  IntColumn get deaths => integer()();
  IntColumn get recovered => integer()();
  IntColumn get active => integer()();
  DateTimeColumn get date => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
