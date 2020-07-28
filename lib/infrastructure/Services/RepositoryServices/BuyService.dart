import 'package:moor_flutter/moor_flutter.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/Buy.dart';
import 'package:statistic_covid19/infrastructure/Utils/EnumUtil.dart';

part 'BuyService.g.dart';

@UseDao(tables: [BuyModel])
class BuyService extends DatabaseAccessor<Database> with _$BuyServiceMixin {
  final Database db;

  BuyService(this.db) : super(db);

  Future<Buy> getBuyInfoByType(ProductType type) async {
    var query = select(this.buyModel)
      ..where((tbl) => tbl.productType.equals(type.toString()));
    return await query.getSingle();
  }

  Future<bool> isShowingBanner() async {
    var query = select(this.buyModel)
      ..where((tbl) => tbl.productType.equals(ProductType.time.toString()));

    var result = await query.getSingle();
    if (result == null) return true;

    return result.date.isBefore(DateTime.now());
  }

  Future<bool> isProVersion() async {
    var query = select(this.buyModel)
      ..where((tbl) => tbl.productType.equals(ProductType.pro.toString()));
    return await query.getSingle() != null;
  }

  Future addOrUpdateUser(Buy buy) async {
    if (buy == null || buy.productType == null || buy.productType.isEmpty)
      return;

    var productType =
        EnumUtil.fromStringEnum(ProductType.values, buy.productType);

    var result = await getBuyInfoByType(productType);
    if (result == null)
      into(this.buyModel).insert(buy);
    else {
      var date = productType == ProductType.time
          ? DateTime.now().add(Duration(days: 3))
          : null;
      update(this.buyModel).replace(Buy(
          id: result.id,
          isBuy: buy.isBuy,
          date: date,
          productType: productType.toString()));
    }
  }
}
