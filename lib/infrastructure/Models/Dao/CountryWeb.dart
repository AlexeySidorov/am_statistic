import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('CountryWeb')
class CountryWebModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get countryId => integer()();
  TextColumn get url => text()();
}
