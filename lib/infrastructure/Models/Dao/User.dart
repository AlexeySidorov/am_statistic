import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('User')
class UserModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get countryId => integer()();
  TextColumn get iso2 => text()();

  @override
  Set<Column> get primaryKey => {id};
}