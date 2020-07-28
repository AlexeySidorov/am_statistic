import 'package:flutter/material.dart';
import 'package:statistic_covid19/infrastructure/Constants/RouteView.dart'
    as routes;
import 'package:statistic_covid19/infrastructure/Services/DialogService.dart';
import 'package:statistic_covid19/infrastructure/Services/NavigationService/NavigationService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/CountryService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/CountryWebService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/GlobalService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/StatusService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/SyncDateService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/UserService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/WorldService.dart';
import 'package:statistic_covid19/infrastructure/Services/Rest/RestService.dart';
import 'package:statistic_covid19/infrastructure/Services/ServiceLocator.dart';
import 'package:statistic_covid19/viewModels/DashboardViewModel.dart';
import 'package:statistic_covid19/viewModels/PayViewModel.dart';
import 'package:statistic_covid19/viewModels/SelectCityViewModel.dart';
import 'package:statistic_covid19/viewModels/SplashViewModel.dart';
import 'package:statistic_covid19/viewModels/SymptomsViewModel.dart';
import 'package:statistic_covid19/views/DashboardView.dart';
import 'package:statistic_covid19/views/PayView.dart';
import 'package:statistic_covid19/views/SelectCityView.dart';
import 'package:statistic_covid19/views/SplashView.dart';
import 'package:statistic_covid19/views/SymptomsView.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.DashboardScreen:
      return MaterialPageRoute(
          builder: (context) =>
              DashboardView(DashboardViewModel(locator<NavigationService>())));
    case routes.SplashScreen:
      return MaterialPageRoute(
          builder: (context) => SplashView(SplashViewModel(
              locator<NavigationService>(),
              locator<UserService>(),
              locator<GlobalService>(),
              locator<CountryService>(),
              locator<RestService>(),
              locator<SyncDateService>(),
              locator<StatusService>(),
              locator<CountryWebService>())));

    case routes.SelectCityScreen:
      return MaterialPageRoute(
          builder: (context) => SelectCityView(SelectCityViewModel(
              settings.arguments,
              locator<NavigationService>(),
              locator<UserService>(),
              locator<CountryService>(),
              locator<RestService>(),
              locator<WorldService>(),
              locator<SyncDateService>(),
              locator<DialogService>())));
    case routes.PayScreen:
      return MaterialPageRoute(builder: (context) => PayView(PayViewModel()));
    case routes.SymptomsScreen:
      return MaterialPageRoute(
          builder: (context) => SymptomsView(SymptomsViewModel()));
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
