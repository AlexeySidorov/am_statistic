// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'messages_all.dart';

class S {
 
  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }
  
  static Future<S> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new S();
    });
  }
  
  String get symptoms_title {
    return Intl.message("Symptoms of coronavirus", name: 'symptoms_title');
  }

  String get symptoms_sub_title1 {
    return Intl.message("The incubation period lasts for 6-12 days. If the infection occurred from person to person, the incubation period does not exceed five days. Longer incubation periods may be typical for transmission from animals.", name: 'symptoms_sub_title1');
  }

  String get symptoms_sub_title2 {
    return Intl.message("The symptoms of Coronavirus 2019-nCoV are similar to those of pneumonia or severe acute respiratory syndrome:", name: 'symptoms_sub_title2');
  }

  String get symptoms_sub_item1 {
    return Intl.message("1. Loss of consciousness (due to progressive destruction of lung tissue).", name: 'symptoms_sub_item1');
  }

  String get symptoms_sub_item2 {
    return Intl.message("2. Dry, unproductive cough.", name: 'symptoms_sub_item2');
  }

  String get symptoms_sub_item3 {
    return Intl.message("3. Fever and temperature rise (38°C or higher, chill).", name: 'symptoms_sub_item3');
  }

  String get symptoms_sub_item4 {
    return Intl.message("4. Difficulty in breathing.", name: 'symptoms_sub_item4');
  }

  String get symptoms_sub_item5 {
    return Intl.message("5. Chest pain.", name: 'symptoms_sub_item5');
  }

  String get symptoms_sub_item6 {
    return Intl.message("6. Headache.", name: 'symptoms_sub_item6');
  }

  String get symptoms_sub_item7 {
    return Intl.message("7. Muscle pain.", name: 'symptoms_sub_item7');
  }

  String get symptoms_sub_item8 {
    return Intl.message("8. A general sickness.", name: 'symptoms_sub_item8');
  }

  String get symptoms_measures_title {
    return Intl.message("Coronavirus prevention measures", name: 'symptoms_measures_title');
  }

  String get symptoms_measures_sub_item1 {
    return Intl.message("1. Wash your hands often with soap for at least 20 seconds.", name: 'symptoms_measures_sub_item1');
  }

  String get symptoms_measures_sub_item2 {
    return Intl.message("2. Do not touch eyes, mouth and mucous organs with dirty hands.", name: 'symptoms_measures_sub_item2');
  }

  String get symptoms_measures_sub_item3 {
    return Intl.message("3. Avoid close contact with infected people.", name: 'symptoms_measures_sub_item3');
  }

  String get symptoms_measures_sub_item4 {
    return Intl.message("4. Do often wet cleaning with disinfectants.", name: 'symptoms_measures_sub_item4');
  }

  String get symptoms_measures_sub_item5 {
    return Intl.message("5. Specify the epidemiological situation when planning your trip.", name: 'symptoms_measures_sub_item5');
  }

  String get symptoms_measures_sub_item6 {
    return Intl.message("6. Use breathing masks to protect the respiratory system.", name: 'symptoms_measures_sub_item6');
  }

  String get symptoms_measures_sub_item7 {
    return Intl.message("7. At the first signs of illness, seek medical help from medical institutions.", name: 'symptoms_measures_sub_item7');
  }

  String get please_wait {
    return Intl.message("Please wait", name: 'please_wait');
  }

  String get attention {
    return Intl.message("Attention", name: 'attention');
  }

  String get updating_dialog_message {
    return Intl.message("Try updating data after 30 minutes", name: 'updating_dialog_message');
  }

  String get title_select_country {
    return Intl.message("Select country", name: 'title_select_country');
  }

  String get search_result1 {
    return Intl.message("The search string must be longer than two letters.", name: 'search_result1');
  }

  String search_result2(name) {
    return Intl.message("Not found country with the name '${name}'", name: 'search_result2', args: [name]);
  }

  String get world {
    return Intl.message("World", name: 'world');
  }

  String get statistic {
    return Intl.message("Statistic", name: 'statistic');
  }

  String get reserved {
    return Intl.message("All rights reserved", name: 'reserved');
  }

  String get change_country {
    return Intl.message("Change country", name: 'change_country');
  }

  String get symptoms {
    return Intl.message("Symptoms", name: 'symptoms');
  }

  String get disable_ads {
    return Intl.message("Disable Ads", name: 'disable_ads');
  }

  String get logout {
    return Intl.message("Logout", name: 'logout');
  }

  String get not_found {
    return Intl.message("Not found", name: 'not_found');
  }

  String get new_cases {
    return Intl.message("New cases", name: 'new_cases');
  }

  String get confirmed {
    return Intl.message("Confirmed", name: 'confirmed');
  }

  String get recovered {
    return Intl.message("Recovered", name: 'recovered');
  }

  String get deaths {
    return Intl.message("Deaths", name: 'deaths');
  }

  String get total_cases {
    return Intl.message("Total cases", name: 'total_cases');
  }

  String get active {
    return Intl.message("Active", name: 'active');
  }

  String get new_cases_world {
    return Intl.message("New cases in the world", name: 'new_cases_world');
  }

  String get total_cases_world {
    return Intl.message("Total cases in the world", name: 'total_cases_world');
  }

  String get none {
    return Intl.message("None", name: 'none');
  }

  String get store {
    return Intl.message("Store", name: 'store');
  }

  String get store_message_disabled_ads_free {
    return Intl.message("Want to disable ads for 3 days for free?", name: 'store_message_disabled_ads_free');
  }

  String get video {
    return Intl.message("Video", name: 'video');
  }

  String ads_resume_again(name) {
    return Intl.message("Advertising will resume again ${name}", name: 'ads_resume_again', args: [name]);
  }


}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
			Locale("en", ""),
			Locale("ru", ""),

    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported);
    };
  }

  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported) {
    if (locale == null || !isSupported(locale)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  @override
  Future<S> load(Locale locale) {
    return S.load(locale);
  }

  @override
  bool isSupported(Locale locale) =>
    locale != null && supportedLocales.contains(locale);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}
