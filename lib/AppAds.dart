import 'dart:async';
import 'dart:io' show Platform;
import 'package:firebase_admob/firebase_admob.dart';

import 'package:ads/ads.dart';
import 'package:flutter/material.dart';

class AppAds {
  static Ads _ads;
  static double offset;

  static final String _appId =
      Platform.isAndroid ? 'ca-app-pub-7894029306259545~9594121786' : '';

  static final String _bannerId =
      Platform.isAndroid ? 'ca-app-pub-7894029306259545/1332488380' : '';
  static final String _bannerPageId =
      Platform.isAndroid ? 'ca-app-pub-7894029306259545/6584815065' : '';
  static final String _bannerPayId =
      Platform.isAndroid ? 'ca-app-pub-7894029306259545/2104119356' : '';

  /// Assign a listener.
  static MobileAdListener _eventListener = (MobileAdEvent event) {
    if (event == MobileAdEvent.clicked) {
      print("_eventListener: The opened ad is clicked on.");
    }
  };

  static void showBanner(
          {String adUnitId,
          AdSize size,
          List<String> keywords,
          String contentUrl,
          bool childDirected,
          List<String> testDevices,
          bool testing,
          MobileAdListener listener,
          State state,
          double anchorOffset,
          AnchorType anchorType}) =>
      _ads?.showBannerAd(
          adUnitId: adUnitId,
          size: size,
          keywords: keywords,
          contentUrl: contentUrl,
          childDirected: childDirected,
          testDevices: testDevices,
          testing: testing,
          listener: listener,
          state: state,
          anchorOffset: anchorOffset,
          anchorType: anchorType);

  static void hideBanner() => _ads?.closeBannerAd();

  /// Call this static function in your State object's initState() function.
  static void init() => _ads ??= Ads(
        _appId,
        bannerUnitId: _bannerPageId,
        size: AdSize.smartBanner,
        testDevices: ['PIXEL_2_API_29:5554'],
        testing: false,
        anchorType: AnchorType.bottom,
        listener: _eventListener,
      );

  /// Remember to call this in the State object's dispose() function.
  static void dispose() => _ads?.dispose();

  static const String testDevice = 'PIXEL_2_API_29:5554';
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      testDevices: testDevice != null ? <String>[testDevice] : null,
      childDirected: false);

  static void showRewardedVideoAd(
      {StreamController<String> listen,
      StreamController<bool> progressCallback}) async {
    if (progressCallback != null) progressCallback.add(true);

    await RewardedVideoAd.instance
        .load(adUnitId: _bannerPayId, targetingInfo: targetingInfo)
        .catchError((e) {
      print("error in loading 1st time");

      if (progressCallback != null) progressCallback.add(false);
      if (listen != null) listen.add(e);
    });

    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      if (event == RewardedVideoAdEvent.closed) {
        if (listen != null) {
          listen.add(null);
        }
      } else if (event == RewardedVideoAdEvent.loaded) {
        if (progressCallback != null) progressCallback.add(false);

        RewardedVideoAd.instance.show().catchError((e) {
          if (progressCallback != null) progressCallback.add(false);
          print("error in showing ad: ${e.toString()}");
        });
      } else if (event == RewardedVideoAdEvent.failedToLoad) {
        if (progressCallback != null) progressCallback.add(false);
      }
    };
  }
}
