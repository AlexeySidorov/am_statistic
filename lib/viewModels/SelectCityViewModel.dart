import 'package:flutter/material.dart';
import 'package:statistic_covid19/generated/i18n.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Managers/Dialogs/AlertRequest.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/SyncDate.dart';
import 'package:statistic_covid19/infrastructure/Services/DialogService.dart';
import 'package:statistic_covid19/infrastructure/Services/NavigationService/NavigationService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/CountryService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/SyncDateService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/UserService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/WorldService.dart';
import 'package:statistic_covid19/infrastructure/Services/Rest/RestService.dart';
import 'package:statistic_covid19/infrastructure/base/BaseViewModel.dart';
import 'package:statistic_covid19/infrastructure/Constants/RouteView.dart'
    as router;

class SelectCityViewModel extends BaseViewModel {
  NavigationService _navigationService;
  UserService _userService;
  CountryService _countryService;
  RestService _restService;
  WorldService _worldService;
  SyncDateService _syncDateService;
  DialogService _dialogService;
  bool isBackNavigation;

  SelectCityViewModel(
      this.isBackNavigation,
      this._navigationService,
      this._userService,
      this._countryService,
      this._restService,
      this._worldService,
      this._syncDateService,
      this._dialogService);

  @override
  void active() {
    invoke(#items);
  }

  @override
  void deactive() {
    _dialogService.closeDialog();
  }

  BuildContext _context;

  @override
  void registryProperties(BuildContext context) {
    _context = context;
    propertyAsync<List<Country>>(#items, () => _getCountries(),
        valueChanged: (v, k) => print("Items: $k: ${v.data?.length}"),
        initial: []);
  }

  List<Country> _countries = new List<Country>();
  List<Country> findCountries = new List<Country>();

  Future<List<Country>> _getCountries() async {
    _countries = await _countryService.getCountries();
    return _countries;
  }

  Future selectedCountry(Country country) async {
    isBackNavigation = false;

    _dialogService.showDialog(DialogType.progressDialog);

    var allStatuses =
        await _restService.getDayOneAllStatusByCountry(country.slug);

    var isUpdateCountry = false;
    if (allStatuses != null && allStatuses.length > 0) {
      if (!isUpdateCountry) {
        isUpdateCountry = true;
        var countryStatus = allStatuses[0];

        await _countryService.updateCountry(Country(
            id: country.id,
            iso2: country.iso2,
            slug: country.slug,
            country: country.country,
            lat:
                countryStatus.lat == null ? 0 : double.parse(countryStatus.lat),
            lon:
                countryStatus.lon == null ? 0 : double.parse(countryStatus.lon),
            locationId: countryStatus.locationId));
      }

      for (var status in allStatuses) {
        await _worldService.addOrUpdateWorld(World(
            id: null,
            countryId: country.id,
            confirmed: status.confirmed,
            deaths: status.deaths,
            recovered: status.recovered,
            active: status.active,
            date: status.date));
      }

      await _userService.addOrUpdateUser(
          User(id: null, countryId: country.id, iso2: country.iso2));

      await _syncDateService.addOrUpdateSyncDateModel(SyncDate(
          id: null, type: SyncType.world.toString(), syncDate: DateTime.now()));

      _dialogService.closeDialog();
    } else {
      _dialogService.closeDialog();
      _dialogService.showDialog(DialogType.dialogMessage,
          title: S.of(_context).attention,
          message: S.of(_context).updating_dialog_message,
          oneButtonTitle: 'OK');
    }

    _navigationService.navigateTo(router.DashboardScreen);
  }

  bool findCountry(String country) {
    country = country.trim();
    findCountries = _countries
        .where((element) =>
            element.country.toLowerCase().contains(country.toLowerCase()))
        .toList();

    if (findCountries == null || findCountries.length == 0) return false;

    return true;
  }

  @override
  void init() {}
}
