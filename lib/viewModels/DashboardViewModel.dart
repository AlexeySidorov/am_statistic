import 'dart:async';

import 'package:flutter/material.dart';
import 'package:statistic_covid19/AppAds.dart';
import 'package:statistic_covid19/generated/i18n.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Models/BottomBarItemModel.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/SyncDate.dart';
import 'package:statistic_covid19/infrastructure/Services/NavigationService/NavigationService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/BuyService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/SyncDateService.dart';
import 'package:statistic_covid19/infrastructure/Services/ServiceLocator.dart';
import 'package:statistic_covid19/infrastructure/base/BaseViewModel.dart';

class DashboardViewModel extends BaseViewModel {
  BuyService _buyService;
  SyncDateService _syncDateService;

  StreamSubscription<String> subscription;

  DashboardViewModel(NavigationService navigationService) {
    invoke(#items);
    invoke(#nameScreen);
    _buyService = locator<BuyService>();
    _syncDateService = locator<SyncDateService>();
  }

  @override
  Future<void> active() async {}

  @override
  void deactive() {}

  BuildContext _context;

  @override
  void registryProperties(BuildContext context) {
    _context = context;
  }

  int currentIndex = 0;

  List<BottomBarItemModel> getBottomBar() {
    var list = List<BottomBarItemModel>();
    list.add(BottomBarItemModel(
        S.of(_context).world,
        'images/world_not_active.png',
        'images/world_active.png',
        BottomBarItemType.world));
    list.add(BottomBarItemModel(
        S.of(_context).statistic,
        'images/country_not_active.png',
        'images/country_active.png',
        BottomBarItemType.statistic));
    //list.add(BottomBarItemModel(
    // "Report", 'images/location.png', BottomBarItemType.report));

    return list;
  }

  Future<bool> _isNeedStartAds() async {
    var result = await _syncDateService.getSyncDateModelByType(SyncType.ads);
    if (result == null) return true;

    var syncDate = DateTime(result.syncDate.year, result.syncDate.month,
        result.syncDate.day, result.syncDate.hour, result.syncDate.minute + 10);

    return DateTime.now().isAfter(syncDate);
  }

  void setTabNavigation(int newIndex) {
    if (currentIndex != newIndex) showAds();

    currentIndex = newIndex;
  }

  Future showAds() async {
    if (await _buyService.isProVersion()) return;
    if (!await _buyService.isShowingBanner()) return;
    if (await _isNeedStartAds()) {
      // ignore: close_sinks
      var streamController = StreamController<String>();
      subscription = streamController.stream.listen((event) async {
        await _syncDateService.addOrUpdateSyncDateModel(SyncDate(
            id: null, type: SyncType.ads.toString(), syncDate: DateTime.now()));

        subscription.cancel();
      });

      AppAds.showRewardedVideoAd(
          listen: streamController, progressCallback: null);
    }
  }

  @override
  void init() {}
}
