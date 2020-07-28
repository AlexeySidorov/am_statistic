import 'package:moor_flutter/moor_flutter.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/CountryWeb.dart';

part 'CountryWebService.g.dart';

@UseDao(tables: [CountryWebModel])
class CountryWebService extends DatabaseAccessor<Database>
    with _$CountryWebServiceMixin {
  final Database db;

  CountryWebService(this.db) : super(db);


  Future<CountryWeb> getCountryUrlByCountryId(int countryId) {
    var query = select(this.countryWebModel)
      ..where((tbl) => tbl.id.equals(countryId));
    return query.getSingle();
  }


  Future addOrUpdateCountryUrl(CountryWeb country) async {
    var result = select(this.countryWebModel)
      ..where((tbl) => tbl.countryId.equals(country.countryId));

     var model = await result.getSingle();
    if (model == null) {
      into(this.countryWebModel).insert(country);
    }
    else if(model.url != null && model.url != country.url){
      update(this.countryWebModel).replace(CountryWeb(id: model.id, countryId: model.countryId, url: country.url));
    }
  }
}
