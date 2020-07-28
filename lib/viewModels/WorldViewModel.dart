import 'package:flutter/material.dart';
import 'package:statistic_covid19/generated/i18n.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Managers/Dialogs/AlertRequest.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/SyncDate.dart';
import 'package:statistic_covid19/infrastructure/Services/DialogService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/CountryService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/GlobalService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/StatusService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/SyncDateService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/UserService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/WorldService.dart';
import 'package:statistic_covid19/infrastructure/Services/Rest/RestService.dart';
import 'package:statistic_covid19/infrastructure/Services/ServiceLocator.dart';
import 'package:statistic_covid19/infrastructure/base/BaseViewModel.dart';
import 'dart:async';

class WorldViewModel extends BaseViewModel {
  GlobalService _globalService = locator<GlobalService>();
  UserService _userService = locator<UserService>();
  CountryService _countryService = locator<CountryService>();
  WorldService _worldService = locator<WorldService>();
  StatusService _statusService = locator<StatusService>();
  DialogService _dialogService = locator<DialogService>();
  SyncDateService _syncServiceDate = locator<SyncDateService>();
  RestService _restService = locator<RestService>();

  @override
  void active() {
    invoke(#country);
    invoke(#worldConfirm);
    invoke(#worldRecovered);
    invoke(#worldDeaths);
    invoke(#worldTotalConfirm);
    invoke(#worldTotalRecovered);
    invoke(#worldTotalDeaths);
    invoke(#countryTotalConfirm);
    invoke(#countryTotalActive);
    invoke(#countryTotalRecovered);
    invoke(#countryTotalDeaths);
    invoke(#countryConfirm);
    invoke(#countryRecovered);
    invoke(#countryDeaths);
  }

  @override
  void deactive() {}

  BuildContext _context;

  @override
  Future<void> registryProperties(BuildContext context) async {
    _context = context;
    propertyAsync(#country, () => _getCountryName(),
        initial: S.of(_context).none);

    ///World total statistic
    propertyAsync(#worldTotalConfirm, () => _getGlobalTotalConfrimedStatistic(),
        initial: S.of(_context).none);
    propertyAsync(
        #worldTotalRecovered, () => _getGlobalTotalRecoveredStatistic(),
        initial: S.of(_context).none);
    propertyAsync(#worldTotalDeaths, () => _getGlobalTotalDeathsStatistic(),
        initial: S.of(_context).none);

    ///World new statistic
    propertyAsync(#worldConfirm, () => _getGlobalConfrimedStatistic(),
        initial: S.of(_context).none);
    propertyAsync(#worldRecovered, () => _getGlobalRecoveredStatistic(),
        initial: S.of(_context).none);
    propertyAsync(#worldDeaths, () => _getGlobalDeathsStatistic(),
        initial: S.of(_context).none);

    ///Country total statistic
    propertyAsync(
        #countryTotalConfirm, () => _getCountryTotalConfrimedStatistic(),
        initial: S.of(_context).none);
    propertyAsync(#countryTotalActive, () => _getCountryTotalActiveStatistic(),
        initial: S.of(_context).none);
    propertyAsync(
        #countryTotalRecovered, () => _getCountryTotalRecoveredStatistic(),
        initial: S.of(_context).none);
    propertyAsync(#countryTotalDeaths, () => _getCountryTotalDeathsStatistic(),
        initial: S.of(_context).none);

    ///Country new statistic
    propertyAsync(#countryConfirm, () => _getCountryConfrimedStatistic(),
        initial: S.of(_context).none);
    propertyAsync(#countryRecovered, () => _getCountryRecoveredStatistic(),
        initial: S.of(_context).none);
    propertyAsync(#countryDeaths, () => _getCountryDeathsStatistic(),
        initial: S.of(_context).none);
  }

  Future updateView() async {
    await _getWorldStatistic();
    await _getCountryStatistic();
    await _updateCountryValue();
    await _updateGlobalValue();
  }

  Future _updateGlobalValue() async {
    var value = getValue<AsyncSnapshot<String>>(#worldConfirm);
    if (value != null) {
      setValue<AsyncSnapshot<String>>(
          #worldConfirm,
          AsyncSnapshot.withData(
              value.connectionState, await _getGlobalConfrimedStatistic()));

      notify(#worldConfirm);
    }

    var valueRecovered = getValue<AsyncSnapshot<String>>(#worldRecovered);
    if (valueRecovered != null) {
      setValue<AsyncSnapshot<String>>(
          #worldRecovered,
          AsyncSnapshot.withData(valueRecovered.connectionState,
              await _getGlobalRecoveredStatistic()));

      notify(#worldRecovered);
    }

    var valueDeaths = getValue<AsyncSnapshot<String>>(#worldDeaths);
    if (valueDeaths != null) {
      setValue<AsyncSnapshot<String>>(
          #worldDeaths,
          AsyncSnapshot.withData(
              valueDeaths.connectionState, await _getGlobalDeathsStatistic()));

      notify(#worldDeaths);
    }

    var valueTotalConfirm = getValue<AsyncSnapshot<String>>(#worldTotalConfirm);
    if (valueTotalConfirm != null) {
      setValue<AsyncSnapshot<String>>(
          #worldTotalConfirm,
          AsyncSnapshot.withData(valueTotalConfirm.connectionState,
              await _getGlobalTotalConfrimedStatistic()));

      notify(#worldTotalConfirm);
    }

    var valueTotalRecovered =
        getValue<AsyncSnapshot<String>>(#worldTotalRecovered);
    if (valueTotalRecovered != null) {
      setValue<AsyncSnapshot<String>>(
          #worldTotalRecovered,
          AsyncSnapshot.withData(valueTotalRecovered.connectionState,
              await _getGlobalTotalRecoveredStatistic()));

      notify(#worldTotalRecovered);
    }

    var valueTotalDeaths = getValue<AsyncSnapshot<String>>(#worldTotalDeaths);
    if (valueTotalDeaths != null) {
      setValue<AsyncSnapshot<String>>(
          #worldTotalDeaths,
          AsyncSnapshot.withData(valueTotalDeaths.connectionState,
              await _getGlobalTotalDeathsStatistic()));

      notify(#worldTotalDeaths);
    }
  }

  Future _updateCountryValue() async {
    var value = getValue<AsyncSnapshot<String>>(#countryDeaths);
    if (value != null) {
      setValue<AsyncSnapshot<String>>(
          #countryDeaths,
          AsyncSnapshot.withData(
              value.connectionState, await _getCountryDeathsStatistic()));

      notify(#countryDeaths);
    }

    var valueRecovered = getValue<AsyncSnapshot<String>>(#countryRecovered);
    if (valueRecovered != null) {
      setValue<AsyncSnapshot<String>>(
          #countryRecovered,
          AsyncSnapshot.withData(valueRecovered.connectionState,
              await _getCountryRecoveredStatistic()));

      notify(#countryRecovered);
    }

    var valueConfirm = getValue<AsyncSnapshot<String>>(#countryConfirm);
    if (valueConfirm != null) {
      setValue<AsyncSnapshot<String>>(
          #countryConfirm,
          AsyncSnapshot.withData(valueConfirm.connectionState,
              await _getCountryConfrimedStatistic()));

      notify(#countryConfirm);
    }

    var valueTotalDeaths = getValue<AsyncSnapshot<String>>(#countryTotalDeaths);
    if (valueTotalDeaths != null) {
      setValue<AsyncSnapshot<String>>(
          #countryTotalDeaths,
          AsyncSnapshot.withData(valueTotalDeaths.connectionState,
              await _getCountryTotalDeathsStatistic()));

      notify(#countryTotalDeaths);
    }

    var valueTotalRecovered =
        getValue<AsyncSnapshot<String>>(#countryTotalRecovered);
    if (valueTotalRecovered != null) {
      setValue<AsyncSnapshot<String>>(
          #countryDTotalRecovered,
          AsyncSnapshot.withData(valueTotalRecovered.connectionState,
              await _getCountryTotalRecoveredStatistic()));

      notify(#countryTotalRecovered);
    }

    var valueTotalConfirm =
        getValue<AsyncSnapshot<String>>(#countryTotalConfirm);
    if (valueTotalConfirm != null) {
      setValue<AsyncSnapshot<String>>(
          #countryTotalConfirm,
          AsyncSnapshot.withData(valueTotalConfirm.connectionState,
              await _getCountryTotalConfrimedStatistic()));

      notify(#countryTotalConfirm);
    }

    var valueTotalActive = getValue<AsyncSnapshot<String>>(#countryTotalActive);
    if (valueTotalActive != null) {
      setValue<AsyncSnapshot<String>>(
          #countryTotalActive,
          AsyncSnapshot.withData(valueTotalActive.connectionState,
              await _getCountryTotalActiveStatistic()));

      notify(#countryTotalActive);
    }
  }

  Future updateData() async {
    await _downloadData();

    var country = await _getCountry();
    if (country != null) await _downloadCountryData(country);

    updateView();
  }

  Future<bool> _isNeedStartSync(SyncType type) async {
    var result = await _syncServiceDate.getSyncDateModelByType(type);
    if (result == null) return true;

    var syncDate = DateTime(result.syncDate.year, result.syncDate.month,
        result.syncDate.day, result.syncDate.hour, result.syncDate.minute + 30);

    return DateTime.now().isAfter(syncDate);
  }

  Future _setSyncData(SyncType type) async {
    await _syncServiceDate.addOrUpdateSyncDateModel(
        SyncDate(id: null, type: type.toString(), syncDate: DateTime.now()));
  }

  Future _downloadData() async {
    if (await _isNeedStartSync(SyncType.global)) {
      _dialogService.showDialog(DialogType.progressDialog);
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
              await _statusService.addOrUpdateStatusCountriesModel(Status(
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
    } else {
      _dialogService.closeDialog();
    }

    _dialogService.closeDialog();
  }

  Future _downloadCountryData(Country country) async {
    if (await _isNeedStartSync(SyncType.world)) {
      _dialogService.showDialog(DialogType.progressDialog);

      var allStatuses =
          await _restService.getDayOneAllStatusByCountry(country.slug);

      if (allStatuses != null && allStatuses.length > 0) {
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

        await _setSyncData(SyncType.world);

        _dialogService.closeDialog();
      } else {
        _dialogService.closeDialog();
      }
    } else {
      _dialogService.closeDialog();
    }
  }

  Future<String> _getCountryName() async {
    var country = await _getCountry();
    if (country != null && country.id > 0) {
      return country == null ||
              country.country == null ||
              country.country.isEmpty
          ? S.of(_context).not_found
          : country.country;
    }

    return S.of(_context).not_found;
  }

  Future<Country> _getCountry() async {
    var user = await _userService.getUser();
    if (user != null && user.countryId > 0) {
      return await _countryService.getCountryById(user.countryId);
    }

    return null;
  }

  Global _globalStatistic;
  Future<Global> _getWorldStatistic() async {
    _globalStatistic = await _globalService.getGlobal();
    return _globalStatistic;
  }

  Future<String> _getGlobalTotalConfrimedStatistic() async {
    if (_globalStatistic == null) await _getWorldStatistic();

    if (_globalStatistic == null || _globalStatistic.totalConfirmed == null)
      return S.of(_context).none;

    return _globalStatistic.totalConfirmed.toString();
  }

  Future<String> _getGlobalTotalRecoveredStatistic() async {
    if (_globalStatistic == null) await _getWorldStatistic();

    if (_globalStatistic == null || _globalStatistic.totalRecovered == null)
      return S.of(_context).none;

    return _globalStatistic.totalRecovered.toString();
  }

  Future<String> _getGlobalTotalDeathsStatistic() async {
    if (_globalStatistic == null) await _getWorldStatistic();

    if (_globalStatistic == null || _globalStatistic.totalDeaths == null)
      return S.of(_context).none;

    return _globalStatistic.totalDeaths.toString();
  }

  Future<String> _getGlobalConfrimedStatistic() async {
    if (_globalStatistic == null) await _getWorldStatistic();

    if (_globalStatistic == null || _globalStatistic.newConfirmed == null)
      return S.of(_context).none;

    return _globalStatistic.newConfirmed.toString();
  }

  Future<String> _getGlobalRecoveredStatistic() async {
    if (_globalStatistic == null) await _getWorldStatistic();

    if (_globalStatistic == null || _globalStatistic.newRecovered == null)
      return S.of(_context).none;

    return _globalStatistic.newRecovered.toString();
  }

  Future<String> _getGlobalDeathsStatistic() async {
    if (_globalStatistic == null) await _getWorldStatistic();

    if (_globalStatistic == null || _globalStatistic.newDeaths == null)
      return S.of(_context).none;

    return _globalStatistic.newDeaths.toString();
  }

  World _countryStatistic;
  Future<World> _getCountryStatistic() async {
    var user = await _userService.getUser();
    var countryId = user == null ? 0 : user.countryId;
    _countryStatistic = await _worldService.getStatisticByCountryId(countryId);
    return _countryStatistic;
  }

  Future<String> _getCountryTotalDeathsStatistic() async {
    if (_countryStatistic == null) await _getCountryStatistic();

    if (_countryStatistic == null || _countryStatistic.deaths == null)
      return S.of(_context).none;

    return _countryStatistic.deaths.toString();
  }

  Future<String> _getCountryTotalConfrimedStatistic() async {
    if (_countryStatistic == null) await _getCountryStatistic();

    if (_countryStatistic == null || _countryStatistic.confirmed == null)
      return S.of(_context).none;

    return _countryStatistic.confirmed.toString();
  }

  Future<String> _getCountryTotalRecoveredStatistic() async {
    if (_countryStatistic == null) await _getCountryStatistic();

    if (_countryStatistic == null || _countryStatistic.recovered == null)
      return S.of(_context).none;

    return _countryStatistic.recovered.toString();
  }

  Future<String> _getCountryTotalActiveStatistic() async {
    if (_countryStatistic == null) await _getCountryStatistic();

    if (_countryStatistic == null || _countryStatistic.active == null)
      return S.of(_context).none;

    return _countryStatistic.active.toString();
  }

  Status _countryDayStatistic;
  Future<Status> _getDayCountryStatistic() async {
    var user = await _userService.getUser();
    var countryId = user == null ? 0 : user.countryId;
    _countryDayStatistic =
        await _statusService.getStatuslByCountryId(countryId);
    return _countryDayStatistic;
  }

  Future<String> _getCountryDeathsStatistic() async {
    if (_countryDayStatistic == null) await _getDayCountryStatistic();

    if (_countryDayStatistic == null || _countryDayStatistic.newDeaths == null)
      return S.of(_context).none;

    return _countryDayStatistic.newDeaths.toString();
  }

  Future<String> _getCountryConfrimedStatistic() async {
    if (_countryDayStatistic == null) await _getDayCountryStatistic();

    if (_countryDayStatistic == null ||
        _countryDayStatistic.newConfirmed == null) return S.of(_context).none;

    return _countryDayStatistic.newConfirmed.toString();
  }

  Future<String> _getCountryRecoveredStatistic() async {
    if (_countryDayStatistic == null) await _getDayCountryStatistic();

    if (_countryDayStatistic == null ||
        _countryDayStatistic.newRecovered == null) return S.of(_context).none;

    return _countryDayStatistic.newRecovered.toString();
  }

  @override
  void init() {}
}
