import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:statistic_covid19/AppAds.dart';
import 'package:statistic_covid19/generated/i18n.dart';
import 'package:statistic_covid19/infrastructure/Models/MenuModel.dart';
import 'package:statistic_covid19/infrastructure/Services/NavigationService/NavigationService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/CountryService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/UserService.dart';
import 'package:statistic_covid19/infrastructure/base/BaseViewModel.dart';
import 'dart:io' show Platform, exit;

import 'package:statistic_covid19/infrastructure/Services/ServiceLocator.dart';
import 'package:statistic_covid19/infrastructure/Constants/RouteView.dart'
    as router;

class MenuViewModel extends BaseViewModel {
  NavigationService _navigationService;
  UserService _userService;
  CountryService _countryService;

  MenuViewModel() {
    _navigationService = locator<NavigationService>();
    _userService = locator<UserService>();
    _countryService = locator<CountryService>();
  }

  Future<String> _initPackageInfo() async {
    if (Platform.isAndroid || Platform.isIOS) {
      var info = await PackageInfo.fromPlatform();
      return 'Statistic Covid19. All rights reserved(${info.version}.${info.buildNumber})';
    } else
      return 'Statistic Covid19. All rights reserved';
  }

  BuildContext _context;

  @override
  void registryProperties(BuildContext context) {
    _context = context;
    propertyAsync(#title, () => _getCountry(), initial: '');
    propertyAsync<List<MenuModel>>(#items, () => _getMenu(),
        valueChanged: (v, k) => print("$k: ${v.data?.length}"), initial: []);
    propertyAsync(#version, () => _initPackageInfo());
  }

  Future<List<MenuModel>> _getMenu() async {
    var menuList = List<MenuModel>();
    menuList.add(MenuModel(
        S.of(_context).change_country, 'images/world.png', MenuType.country));
    menuList.add(MenuModel(
        S.of(_context).symptoms, 'images/cough.png', MenuType.symptoms));
    menuList.add(MenuModel(
        S.of(_context).disable_ads, 'images/buy_icon.png', MenuType.pay));
    menuList.add(
        MenuModel(S.of(_context).logout, 'images/logout.png', MenuType.logout));

    return menuList;
  }

  Future<String> _getCountry() async {
    var user = await _userService.getUser();
    if (user != null && user.countryId > 0) {
      var country = await _countryService.getCountryById(user.countryId);

      return country == null ||
              country.country == null ||
              country.country.isEmpty
          ? S.of(_context).not_found
          : country.country;
    }

    return S.of(_context).not_found;
  }

  bool isNav = false;
  void selectedMenuItem(MenuModel model) {
    isNav = true;
    AppAds.hideBanner();
    AppAds.dispose();

    switch (model.type) {
      case MenuType.logout:
        exit(0);
        break;
      case MenuType.country:
        _navigationService.navigateTo(router.SelectCityScreen, arguments: true);
        break;
      case MenuType.pay:
        _navigationService.navigateTo(router.PayScreen);
        break;
      case MenuType.symptoms:
        _navigationService.navigateTo(router.SymptomsScreen);
        break;
      default:
        break;
    }
  }

  ///Not use
  @override
  void active() {}

  ///Not use
  @override
  void deactive() {}

  @override
  void init() {
    invoke(#title);
    invoke(#items);
    invoke(#version);
    AppAds.hideBanner();
    AppAds.dispose();
  }
}
