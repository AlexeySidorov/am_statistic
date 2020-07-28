import 'package:moor_flutter/moor_flutter.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/Buy.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/Country.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/CountryWeb.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/Global.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/Status.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/SyncDate.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/User.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/World.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/BuyService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/CountryService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/CountryWebService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/GlobalService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/StatusService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/SyncDateService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/UserService.dart';
import 'package:statistic_covid19/infrastructure/Services/RepositoryServices/WorldService.dart';

part 'AppDataBase.moor.g.dart';

@UseMoor(tables: [
  CountryModel,
  GlobalModel,
  UserModel,
  WorldModel,
  SyncDateModel,
  StatusModel,
  CountryWebModel,
  BuyModel
], daos: [
  CountryService,
  GlobalService,
  UserService,
  WorldService,
  SyncDateService,
  StatusService,
  CountryWebService,
  BuyService
])
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 5;
}
