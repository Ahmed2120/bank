import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler{

  Future initializeDB() async{
    String path = await getDatabasesPath();

    return openDatabase(join(path, 'bank.db'),
      onCreate: (database, version) async{
        Batch batch = database.batch();
        batch.execute('CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, email TEXT NOT NULL, address TEXT NOT NULL, balance DOUBLE)');
        batch.execute('CREATE TABLE transfers(id INTEGER PRIMARY KEY AUTOINCREMENT, "from" TEXT NOT NULL, "to" TEXT NOT NULL, amount DOUBLE)');
        await batch.commit();
      },
      version: 1
    );
  }
}