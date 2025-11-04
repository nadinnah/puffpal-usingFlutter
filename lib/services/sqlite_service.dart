import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static Database? _myDatabase;

  Future<Database?> get myDataBase async{
    if(_myDatabase == null){
      _myDatabase = await initialize();
      return _myDatabase;
    }else{
      return _myDatabase;
    }
  }

  int version=1;

  Future<void> deleteOldDatabase() async{
    String myPath= await getDatabasesPath();
    String path= join(myPath, 'puffpal1.db');

    if(await databaseExists(path)){
      await deleteDatabase(path);
    }
  }

  initialize() async {
    String myPath = await getDatabasesPath();
    String path = join(myPath, 'puffpal2.db');
    Database myDb = await openDatabase(
        path, version: version, onCreate: (db, version) async {
      await db.execute('''
       CREATE TABLE IF NOT EXISTS Users (
       id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
       firebaseId TEXT,
       password TEXT NOT NULL,
       name TEXT NOT NULL,
       number TEXT NOT NULL,
       email TEXT NOT NULL UNIQUE,
       age INTEGER NOT NULL,
       gender TEXT NOT NULL
       );
      ''');
    });
    return myDb;
  }

  Future<void> updateUserFieldById(int id, Map<String, dynamic> fieldsToUpdate) async {
    final db = await myDataBase;

    try {
      await db!.update(
        'Users',
        fieldsToUpdate,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception("Failed to update user field(s) in SQLite.");
    }
  }

  Future<int> insertUser(Map<String, dynamic> userData) async {
    final db = await myDataBase;
    return await db!.insert(
      'Users',
      {
        ...userData,
      },
    );
  }

  Future<String?> getNameByEmail(String email) async {
    final db = await myDataBase;
    var result = await db!.query(
      'Users',
      columns: ['name'],
      where: 'email = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      return result.first['name'] as String;
    }
    return null;
  }

}