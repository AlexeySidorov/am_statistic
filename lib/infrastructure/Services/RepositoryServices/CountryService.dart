import 'package:moor_flutter/moor_flutter.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/Country.dart';

part 'CountryService.g.dart';

@UseDao(tables: [CountryModel])
class CountryService extends DatabaseAccessor<Database>
    with _$CountryServiceMixin {
  final Database db;

  CountryService(this.db) : super(db);

  Future<List<Country>> getCountries() async {
    var query = select(this.countryModel)
      ..orderBy([(c) => OrderingTerm(expression: c.country)]);
    var list = await query.get();
    if (list != null && list.length > 0)
      list.retainWhere((element) => element.slug != 'united-states');

    return list;
  }

  Future<Country> getCountryById(int countryId) {
    var query = select(this.countryModel)
      ..where((tbl) => tbl.id.equals(countryId));
    return query.getSingle();
  }

  Future<Country> getCountryBySlug(String slug) {
    var query = select(this.countryModel)
      ..where((tbl) => tbl.slug.equals(slug));
    return query.getSingle();
  }

  Future<int> insertCountry(Country country) async {
    var result = select(this.countryModel)
      ..where((tbl) => tbl.country.equals(country.country));
    if (await result.getSingle() == null) {
      return into(this.countryModel).insert(country);
    }

    return 0;
  }

  Future updateCountry(Country country) =>
      update(this.countryModel).replace(country);

  Future deleteCountry(Country country) =>
      delete(this.countryModel).delete(country);
}
