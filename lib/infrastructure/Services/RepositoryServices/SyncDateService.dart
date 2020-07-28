import 'package:moor_flutter/moor_flutter.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/SyncDate.dart';

part 'SyncDateService.g.dart';

@UseDao(tables: [SyncDateModel])
class SyncDateService extends DatabaseAccessor<Database>
    with _$SyncDateServiceMixin {
  final Database db;

  SyncDateService(this.db) : super(db);

  //Get
  Future<List<SyncDate>> getSyncDateModel() => select(this.syncDateModel).get();

  Future<SyncDate> getSyncDateModelByType(SyncType type) async {
    var result = select(this.syncDateModel)
      ..where((tbl) => tbl.type.equals(type.toString()));
    return await result.getSingle();
  }

  //Post
  Future addOrUpdateSyncDateModel(SyncDate model) async {
    if (model == null) return null;

    var result = select(this.syncDateModel)
      ..where((tbl) => tbl.type.equals(model.type));
    var syncModel = await result.getSingle();

    if (syncModel != null)
      update(this.syncDateModel).replace(SyncDate(
          id: syncModel.id, type: model.type, syncDate: model.syncDate));
    else
      into(this.syncDateModel).insert(model);
  }
}
