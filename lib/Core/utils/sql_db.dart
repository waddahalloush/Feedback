import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDB {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> initialDb() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, "med.db");
    Database myDb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onUpgrade: _onUpgrade,
    );
    return myDb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {}
  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute(
        'CREATE TABLE Department (dep_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, dep_name TEXT UNIQUE )');
    batch.execute(""" 
CREATE TABLE Doctors (
  doc_id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
  doc_name TEXT UNIQUE,
  department Text
   )
    """);
    batch.execute(""" 
CREATE TABLE FeedBack (
  f_id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
  f_note TEXT,
  f_feel TEXT,
  f_time TEXT,
  doctor Text
   )
    """);
    await batch.commit();
  }

  //Select
  Future<List<Map>> readData(String table) async {
    Database? myDB = await db;
    List<Map> response = await myDB!.query(table);
    return response;
  }
 

  //Insert
  Future<int> insertData(String table, Map<String, Object?> values) async {
    Database? myDB = await db;
    int response = await myDB!
        .insert(table, values, conflictAlgorithm: ConflictAlgorithm.replace);
    return response;
  }

  //Update
  Future<int> updateData(
      String table, Map<String, Object?> values, String myWhere) async {
    Database? myDB = await db;
    int response = await myDB!.update(table, values, where: myWhere);
    return response;
  }

  //Delete
  Future<int> deleteData(String table, String mywhere) async {
    Database? myDB = await db;
    int response = await myDB!.delete(table, where: mywhere);
    return response;
  }
}
