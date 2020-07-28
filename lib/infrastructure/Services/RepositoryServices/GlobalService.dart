import 'package:moor_flutter/moor_flutter.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/Global.dart';
import 'package:statistic_covid19/infrastructure/Responces/GlobalResponce.dart';

part 'GlobalService.g.dart';

@UseDao(tables: [GlobalModel])
class GlobalService extends DatabaseAccessor<Database>
    with _$GlobalServiceMixin {
  final Database db;

  GlobalService(this.db) : super(db);

  //Get
  Future<Global> getGlobal() => select(this.globalModel).getSingle();

  Future addGlobal(Global global) =>
      into(this.globalModel).insert(global);

  Future addOrUpdate(GlobalResponce global) async {
    var result = await select(this.globalModel).getSingle();
    if (result == null) {
      await addGlobal(new Global(
          id: null,
          newConfirmed: global.newConfirmed,
          totalConfirmed: global.totalConfirmed,
          newDeaths: global.newDeaths,
          newRecovered: global.newRecovered,
          totalDeaths: global.totalDeaths,
          totalRecovered: global.totalRecovered));
    } else {
     await update(this.globalModel).replace(new Global(
          id: result.id,
          newConfirmed: global.newConfirmed,
          totalConfirmed: global.totalConfirmed,
          newDeaths: global.newDeaths,
          newRecovered: global.newRecovered,
          totalDeaths: global.totalDeaths,
          totalRecovered: global.totalRecovered));
    }
  }

  Future updateGlobal(Global global) async {
    var result = select(this.globalModel)
      ..where((tbl) => tbl.id.equals(global.id));

    if (result != null) {
      update(this.globalModel).replace(global);
    }
  }

  Future deleteGlobal(int id) async {
    var result = select(this.globalModel)..where((tbl) => tbl.id.equals(id));

    if (result != null) {
      var global = await result.getSingle();
      delete(this.globalModel).delete(global);
    }
  }
}
