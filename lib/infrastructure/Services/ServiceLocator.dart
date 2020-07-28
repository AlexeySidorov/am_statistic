import 'package:get_it/get_it.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Services/DialogService.dart';
import 'package:statistic_covid19/infrastructure/Services/NavigationService/NavigationService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/BuyService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/CountryService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/CountryWebService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/GlobalService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/StatusService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/SyncDateService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/UserService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/WorldService.dart';
import 'package:statistic_covid19/infrastructure/Services/Rest/RestService.dart';

GetIt locator = GetIt.instance;

void setupLocator(Database db) {
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => RestService());
  locator.registerFactory(() => UserService(db));
  locator.registerFactory(() => GlobalService(db));
  locator.registerFactory(() => WorldService(db));
  locator.registerFactory(() => CountryService(db));
  locator.registerFactory(() => SyncDateService(db));
  locator.registerFactory(() => StatusService(db));
  locator.registerFactory(() => CountryWebService(db));
  locator.registerFactory(() => BuyService(db));
}
