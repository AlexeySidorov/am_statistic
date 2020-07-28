import 'package:moor_flutter/moor_flutter.dart';
import 'package:statistic_covid19/infrastructure/AppDataBase.moor.dart';
import 'package:statistic_covid19/infrastructure/Models/Dao/User.dart';

part 'UserService.g.dart';

@UseDao(tables: [UserModel])
class UserService extends DatabaseAccessor<Database> with _$UserServiceMixin {
  final Database db;

  UserService(this.db) : super(db);

  Future<User> getUser() => select(this.userModel).getSingle();

  Future addOrUpdateUser(User user) async {
    var result = await getUser();
    if (result == null)
      into(this.userModel).insert(user);
    else
      update(this.userModel).replace(
          User(id: result.id, countryId: user.countryId, iso2: user.iso2));
  }
}
