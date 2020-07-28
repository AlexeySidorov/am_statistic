import 'package:flutter/material.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/CountryWebService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/UserService.dart';
import 'package:statistic_covid19/infrastructure/Services/ServiceLocator.dart';
import 'package:statistic_covid19/infrastructure/base/BaseViewModel.dart';

class StatisticViewModel extends BaseViewModel {
  UserService _userService;
  CountryWebService _countryWebService;

  StatisticViewModel() {
    _userService = locator<UserService>();
    _countryWebService = locator<CountryWebService>();
  }

  @override
  void active() {
    invoke(#url);
  }

  @override
  void deactive() {}

  @override
  Future<void> registryProperties(BuildContext context) async {
    propertyAsync(#url, () => _getUrl(), initial: "");
  }

  Future<String> _getUrl() async {
    var user = await _userService.getUser();
    if (user == null || user.countryId == 0) return "";

    var result =
        await _countryWebService.getCountryUrlByCountryId(user.countryId);
    if (result == null || result.url == null || result.url.isEmpty) return "";

    return result.url;
  }

  @override
  void init() {}
}
