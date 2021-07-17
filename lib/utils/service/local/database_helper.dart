import 'package:itsmushi/models/contact.dart';
import 'package:sqflite/sqflite.dart';

import 'package:sqflite/sqlite_api.dart';

final String table_name = "sample2";
final String col_id = "id";
final String col_name = "name";
final String col_number = "number";


class DatabaseHelper {
  Database? _database;

  bool iscreated = false;
  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "mydb.db";

    var database = openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(''' 
      create table $table_name (
        $col_id integer primary key autoincrement,
        $col_name text not_null,
        $col_number text not_null
      )
       '''); //we use ''' for multline
      },
    );

    print("iscreatedreal");
    return database;
  }

  Future<void> insertContact(ContactModel contactModel) async {
    var db = await this.database;
    var result = await db!.insert(table_name, contactModel.toJson());
    print("result : $result");
  }

}
