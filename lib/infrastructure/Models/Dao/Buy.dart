import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('Buy')
class BuyModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isBuy => boolean()();
  TextColumn get productType => text()();
  DateTimeColumn get date => dateTime().nullable()();
}

enum ProductType { pro, time, none }
