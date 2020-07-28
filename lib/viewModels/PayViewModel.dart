import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:statistic_covid19/AppAds.dart';
import 'package:statistic_covid19/Helpers/PurchaseHelper.dart';
import 'package:statistic_covid19/generated/i18n.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Managers/Dialogs/AlertRequest.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/Buy.dart';
import 'package:statistic_covid19/infrastructure/Services/DialogService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/BuyService.dart';
import 'package:statistic_covid19/infrastructure/Services/ServiceLocator.dart';
import 'package:statistic_covid19/infrastructure/Utils/DateUtils.dart';
import 'package:statistic_covid19/infrastructure/base/BaseViewModel.dart';

class PayViewModel extends BaseViewModel {
  DialogService _dialogService;
  BuyService _buyService;
  PurchaseHelper purchase;

  StreamSubscription<String> subscription;

  StreamSubscription<bool> subscriptionProgress;

  PayViewModel() {
    _dialogService = locator<DialogService>();
    _buyService = locator<BuyService>();

    purchase = PurchaseHelper();
    purchase.init();
  }

  @override
  void active() {
    invoke(#showAds);
    invoke(#adsMessage);
    invoke(#adsMessageTitle);
  }

  @override
  void deactive() {}

  BuildContext _context;

  @override
  void registryProperties(BuildContext context) {
    _context = context;
    // propertyAsync(#pay, () => _pay());
    // propertyAsync(#restore, () => _restorePay());
    propertyAsync(#videoads, () => _showVideoAds());
    propertyAsync(#showAds, () => _isShowAds(false), initial: true);
    propertyAsync(#adsMessage, () => _isShowAds(true), initial: false);
    propertyAsync(#adsMessageTitle, () => _getAdsMessage());

    /*if (!await _buyService.isProVersion() &&
        await _buyService.isShowingBanner()) {
      AppAds.init();
      AppAds.showBanner();
    }*/
  }

  String price = "1\$";

  Future<bool> _isShowAds(bool isMessage) async {
    if (await _buyService.isProVersion() ||
        !await _buyService.isShowingBanner()) return isMessage ? true : false;

    return isMessage ? false : true;
  }

  Future<String> _getAdsMessage() async {
    if (await _isShowAds(true)) {
      var result = await _buyService.getBuyInfoByType(ProductType.time);
      if (result != null) {
        return S.of(_context).ads_resume_again(DateUtils.dateFormatByLocale(
            result.date, ui.window.locale.languageCode));
      }
    }
    return '';
  }

  Future _showVideoAds() async {
    // ignore: close_sinks
    var streamController = StreamController<String>();
    subscription = streamController.stream.listen((event) async {
      await _buyService.addOrUpdateUser(Buy(
          id: null,
          productType: ProductType.time.toString(),
          isBuy: event == null,
          date: DateTime.now().add(Duration(days: 3))));
      _updateAdsLogic();
      AppAds.hideBanner();
      subscription.cancel();
    });

    // ignore: close_sinks
    var progressCallback = StreamController<bool>();
    subscriptionProgress = progressCallback.stream.listen((event) {
      if (!event) {
        _dialogService.closeDialog();
        subscriptionProgress.cancel();
      } else
        _dialogService.showDialog(DialogType.progressDialog);
    });

    AppAds.showRewardedVideoAd(
        listen: streamController, progressCallback: progressCallback);
  }

  Future _pay() async {
    if (await purchase.connection()) await purchase.requestPurchase();
  }

  Future _restorePay() async {
    if (await purchase.connection()) await purchase.getPurchaseHistory();
  }

  Future _updateAdsLogic() async {
    var isVisibleMessage = await _isShowAds(true);
    if (isVisibleMessage) {
      var valueAds = getValue<AsyncSnapshot<bool>>(#showAds);
      if (valueAds != null) {
        setValue<AsyncSnapshot<bool>>(
            #showAds,
            AsyncSnapshot.withData(
                valueAds.connectionState, !isVisibleMessage));

        notify(#showAds);
      }

      var valueMessage = getValue<AsyncSnapshot<bool>>(#adsMessage);
      if (valueMessage != null) {
        setValue<AsyncSnapshot<bool>>(
            #adsMessage,
            AsyncSnapshot.withData(
                valueMessage.connectionState, isVisibleMessage));

        notify(#adsMessageTitle);
      }

      var message = getValue<AsyncSnapshot<String>>(#adsMessageTitle);
      if (message != null) {
        setValue<AsyncSnapshot<String>>(
            #adsMessageTitle,
            AsyncSnapshot.withData(
                message.connectionState, await _getAdsMessage()));

        notify(#adsMessage);
      }
    }
  }

  void onBackButtonPressed() {
    //  AppAds.hideBanner();
  }

  @override
  void init() {}
}
