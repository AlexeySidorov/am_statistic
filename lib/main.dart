import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:statistic_covid19/Settings.dart';
import 'package:statistic_covid19/generated/i18n.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Managers/Dialogs/DialogManager.dart';
import 'package:statistic_covid19/infrastructure/Services/NavigationService/NavigationService.dart';
import 'package:statistic_covid19/infrastructure/Services/ServiceLocator.dart';
import 'package:statistic_covid19/infrastructure/Constants/RouteView.dart'
    as routes;
import 'package:statistic_covid19/infrastructure/Services/NavigationService/Router.dart'
    as router;
import 'package:statistic_covid19/infrastructure/SubscriptionModel.dart';
import 'package:path_provider/path_provider.dart' as paths;
import 'package:path/path.dart' as p;
import 'package:moor_ffi/moor_ffi.dart';

void main() {
  final db = constructDb();
  setupLocator(db);
  InAppPurchaseConnection.enablePendingPurchases();
  runApp(Covid19App());
}

Database constructDb({bool logStatements = false}) {
  if (Platform.isIOS || Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'db.sqlite'));
      return VmDatabase(dbFile, logStatements: logStatements);
    });
    return Database(executor);
  }
  if (Platform.isMacOS || Platform.isLinux) {
    final file = File('db.sqlite');
    return Database(VmDatabase(file, logStatements: logStatements));
  }
  // if (Platform.isWindows) {
  //   final file = File('db.sqlite');
  //   return Database(VMDatabase(file, logStatements: logStatements));
  // }
  return Database(VmDatabase.memory(logStatements: logStatements));
}

class Covid19App extends StatelessWidget {
  static SubscriptionModel subscriptionListener = SubscriptionModel();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Settings.getThemeApp(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        //Locale.fromSubtags(languageCode: 'en')
        Locale.fromSubtags(languageCode: 'ru')
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) return supportedLocales.first;
        for (final Locale supportedLocale in supportedLocales) {
          if (locale.languageCode == supportedLocale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
      initialRoute: routes.SplashScreen,
      builder: (context, widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogManager(
            child: widget,
          ),
        ),
      ),
    );
  }
}
