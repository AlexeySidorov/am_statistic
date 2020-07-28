import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/SyncDate.dart';
import 'package:statistic_covid19/infrastructure/Services/NavigationService/NavigationService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/CountryService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/CountryWebService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/GlobalService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/StatusService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/SyncDateService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/UserService.dart';
import 'package:statistic_covid19/infrastructure/Services/Rest/RestService.dart';
import 'package:statistic_covid19/infrastructure/base/BaseViewModel.dart';
import 'package:statistic_covid19/infrastructure/Constants/RouteView.dart'
    as router;

final logger = Logger();

class SplashViewModel extends BaseViewModel {
  NavigationService _navigationService;
  UserService _userService;
  GlobalService _globalService;
  CountryService _countryService;
  SyncDateService _syncServiceDate;
  RestService _restService;
  StatusService _statusCountries;
  CountryWebService _countryWebService;

  SplashViewModel(
      this._navigationService,
      this._userService,
      this._globalService,
      this._countryService,
      this._restService,
      this._syncServiceDate,
      this._statusCountries,
      this._countryWebService);

  @override
  Future<void> active() async {
    await _downloadData();
  }

  Future<bool> _isExistUser() async {
    var user = await _userService.getUser();
    return user != null && user.id != 0;
  }

  Future<bool> _isNeedStartSync(SyncType type) async {
    var result = await _syncServiceDate.getSyncDateModelByType(type);
    if (result == null) return true;

    var syncDate = DateTime(result.syncDate.year, result.syncDate.month,
        result.syncDate.day, result.syncDate.hour + 2, result.syncDate.minute);

    return DateTime.now().isAfter(syncDate);
  }

  Future _setSyncData(SyncType type) async {
    await _syncServiceDate.addOrUpdateSyncDateModel(
        SyncDate(id: null, type: type.toString(), syncDate: DateTime.now()));
  }

  Future<void> _downloadCountry() async {
    if (!await _isNeedStartSync(SyncType.country)) return;

    var countryList = await _restService.getCountries();
    if (countryList != null && countryList.length > 0) {
      var countries = await _countryService.getCountries();
      if (countries == null ||
          countries.length == 0 ||
          countries.length != countryList.length) {
        for (var country in countryList) {
          int id = await _countryService.insertCountry(new Country(
              id: null,
              country: country.country,
              slug: country.slug,
              iso2: country.iso2));

          await _countryWebService.addOrUpdateCountryUrl(CountryWeb(
              id: null,
              countryId: id,
              url: country.slug == "russia"
                  ? "https://coronavirus-monitor.ru/"
                  : "https://coronavirus-monitor.com"));
        }
      }

      await _setSyncData(SyncType.country);
    }
  }

  Future _downloadData() async {
    await _downloadCountry();

    if (await _isNeedStartSync(SyncType.global)) {
      var globalData =
          await _restService.getSummaries().catchError((Object obj) {});
      if (globalData != null && globalData.global != null) {
        {
          await _globalService.addOrUpdate(globalData.global);
          await _setSyncData(SyncType.global);
        }

        if (globalData != null &&
            globalData.countries != null &&
            globalData.countries.length > 0) {
          for (var country in globalData.countries) {
            var result = await _countryService.getCountryBySlug(country.slug);
            if (result != null && result.id > 0) {
              await _statusCountries.addOrUpdateStatusCountriesModel(Status(
                  id: null,
                  newConfirmed: country.newConfirmed,
                  newDeaths: country.newDeaths,
                  newRecovered: country.newRecovered,
                  countryId: result.id,
                  totalConfirmed: country.totalConfirmed,
                  totalDeaths: country.totalDeaths,
                  totalRecovered: country.totalRecovered));
            }
          }
          await _setSyncData(SyncType.status);
        }
      }
    }

    if (await _isExistUser())
      _navigationService.navigateTo(router.DashboardScreen);
    else
      _navigationService.navigateTo(router.SelectCityScreen, arguments: false);
  }

  @override
  void deactive() {}

  @override
  void registryProperties(BuildContext context) {}

  @override
  void init() {}
}
