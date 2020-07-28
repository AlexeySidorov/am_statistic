import 'package:moor_flutter/moor_flutter.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/World.dart';

part 'WorldService.g.dart';

@UseDao(tables: [WorldModel])
class WorldService extends DatabaseAccessor<Database> with _$WorldServiceMixin {
  final Database db;

  WorldService(this.db) : super(db);

  Future addOrUpdateWorld(World world) async {
    var result = select(this.worldModel)
      ..where((tbl) => tbl.countryId.equals(world.countryId))
      ..where((tbl) => tbl.date.equals(world.date));

    var data = await result.getSingle();
    if (data == null) {
      into(this.worldModel).insert(world);
    } else
      update(this.worldModel).replace(World(
          id: data.id,
          countryId: data.id,
          confirmed: world.confirmed,
          deaths: world.deaths,
          recovered: world.recovered,
          active: world.active));
  }

  Future<World> getStatisticByCountryId(int countryId) async {
    var currentDate = DateTime.now().add(Duration(days: -3));
    var query = select(this.worldModel)
      ..where((tbl) => tbl.countryId.equals(countryId));

    var list = await query.get();
    if (list == null || list.length == 0) return null;

    var countryStatisticList = list
        .where((element) =>
            element.date != null && currentDate.isBefore(element.date))
        .toList();

    return countryStatisticList == null || countryStatisticList.length == 0
        ? null
        : countryStatisticList[countryStatisticList.length - 1];
  }
}
