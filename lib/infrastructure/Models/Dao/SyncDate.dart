import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('SyncDate')
class SyncDateModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().nullable()();
  DateTimeColumn get syncDate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

enum SyncType {
  world,
  country,
  city,
  worldLive,
  countryLive,
  cityLive,
  global,
  status,
  ads
}
