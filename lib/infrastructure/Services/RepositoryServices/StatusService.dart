import 'package:moor_flutter/moor_flutter.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/Status.dart';

part 'StatusService.g.dart';

@UseDao(tables: [StatusModel])
class StatusService extends DatabaseAccessor<Database>
    with _$StatusServiceMixin {
  final Database db;

  StatusService(this.db) : super(db);

  //Get
  Future<List<Status>> getStatuAllCountries() => select(this.statusModel).get();

  Future<Status> getStatuslByCountryId(int countryId) async {
    var result = select(this.statusModel)
      ..where((tbl) => tbl.countryId.equals(countryId));
    return await result.getSingle();
  }

  //Post
  Future addOrUpdateStatusCountriesModel(Status model) async {
    if (model == null) return null;

    var result = select(this.statusModel)
      ..where((tbl) => tbl.countryId.equals(model.countryId));
    var statusModel = await result.getSingle();

    if (statusModel != null)
      update(this.statusModel).replace(Status(
          id: statusModel.id,
          newConfirmed: model.newConfirmed,
          newDeaths: model.newDeaths,
          newRecovered: model.newRecovered,
          countryId: model.countryId,
          totalConfirmed: model.totalConfirmed,
          totalDeaths: model.totalDeaths,
          totalRecovered: model.totalRecovered));
    else
      into(this.statusModel).insert(model);
  }
}
