import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('Country')
class CountryModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get country => text()();
  TextColumn get slug => text()();
  TextColumn get iso2 => text()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  TextColumn get locationId => text().nullable()();
}
