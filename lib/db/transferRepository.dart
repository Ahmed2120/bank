import 'package:bank/db/databaseHandler.dart';
import 'package:bank/models/transfer.dart';
import 'package:bank/models/user.dart';
import 'package:sqflite/sqflite.dart';

class TransferRepository {
  String table_name = 'transfers';
  DatabaseHandler _databaseHandler = DatabaseHandler();

  Future insert(Transfer transfer) async {
    int result = 0;
    final Database db = await _databaseHandler.initializeDB();
    result = await db.insert(table_name, transfer.toJson());
    return result;
  }

  // Future retrieve() async {
  //   final Database db = await _databaseHandler.initializeDB();
  //   final List<Map<String, Object?>> queryResult = await db.query(table_name);
  //   return queryResult.map((e) => User.fromJson(e)).toList();
  // }
  //
  // Future update(User user) async {
  //   final Database db = await _databaseHandler.initializeDB();
  //   await db.update(table_name, user.toJson(), where: 'id = ?', whereArgs: [user.id]);
  // }
}
