import 'package:bank/db/databaseHandler.dart';
import 'package:bank/models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository {
  String table_name = 'users';
  DatabaseHandler _databaseHandler = DatabaseHandler();

  Future insert(User user) async {
    int result = 0;
    final Database db = await _databaseHandler.initializeDB();
    result = await db.insert(table_name, user.toJson());
    return result;
  }

  Future retrieve() async {
    final Database db = await _databaseHandler.initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query(table_name);
    return queryResult.map((e) => User.fromJson(e)).toList();
  }

  Future update(User user) async {
    final Database db = await _databaseHandler.initializeDB();
    await db.update(table_name, user.toJson(), where: 'id = ?', whereArgs: [user.id]);
  }
}
