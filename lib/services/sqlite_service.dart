import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static Database? _myDatabase;

  Future<Database?> get myDataBase async {
    if (_myDatabase == null) {
      _myDatabase = await initialize();
      return _myDatabase;
    } else {
      return _myDatabase;
    }
  }

  int version = 6;

  Future<void> deleteOldDatabase() async {
    String myPath = await getDatabasesPath();
    String path = join(myPath, 'puffpal1.db');

    if (await databaseExists(path)) {
      await deleteDatabase(path);
    }
  }

  initialize() async {
    String myPath = await getDatabasesPath();
    String path = join(myPath, 'puffpal2.db');
    Database myDb = await openDatabase(
      path,
      version: version,
      onCreate: (db, version) async {
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
        await db.execute('''
          CREATE TABLE IF NOT EXISTS Symptoms (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            email TEXT NOT NULL,
            date TEXT NOT NULL,
            result TEXT,
            severity INTEGER,
            UNIQUE(email, date)
          );
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS Medications (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            userEmail TEXT NOT NULL,
            name TEXT NOT NULL,
            startTime TEXT NOT NULL,
            interval INTEGER NOT NULL
          );
        ''');
      },

      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 6) {
          try {
            await db.execute('ALTER TABLE Symptoms ADD COLUMN severity INTEGER;');
          } catch (e) {
            await db.execute('''
            CREATE TABLE IF NOT EXISTS Symptoms (
              id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
              email TEXT NOT NULL,
              date TEXT NOT NULL,
              result TEXT,
              UNIQUE(email, date)
            );
          ''');
          }
        }
      },
    );
    return myDb;
  }

  Future<void> updateUserFieldByEmail(
    String email,
    Map<String, dynamic> fieldsToUpdate,
  ) async {
    final db = await myDataBase;

    try {
      await db!.update(
        'Users',
        fieldsToUpdate,
        where: 'email = ?',
        whereArgs: [email],
      );
    } catch (e) {
      throw Exception("Failed to update user field(s) in SQLite.");
    }
  }

  Future<Map<String, dynamic>> loadUserDataByEmail(String email) async {
    final db = await myDataBase;
    var result = await db!.query(
      'Users',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      throw Exception("User not found in SQLite.");
    }
  }

  Future<int> insertUser(Map<String, dynamic> userData) async {
    final db = await myDataBase;
    return await db!.insert('Users', {...userData}, conflictAlgorithm: ConflictAlgorithm.replace,);
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

  Future<void> logSymptom(String email, String resultText, int severity) async {
    final db = await myDataBase;
    String today = DateTime.now().toString().split(' ')[0];

    await db!.insert(
      'Symptoms',
      {
        'email': email,
        'date': today,
        'result': resultText,
        'severity': severity,
        // Save the specific advice given
      },
      conflictAlgorithm:
          ConflictAlgorithm.replace, // Overwrite if they somehow track twice
    );
  }

  Future<bool> hasTrackedToday(String email) async {
    final db = await myDataBase;
    String today = DateTime.now().toString().split(' ')[0];

    var result = await db!.query(
      'Symptoms',
      where: 'email = ? AND date = ?',
      whereArgs: [email, today],
    );
    return result.isNotEmpty;
  }

  Future<Map<DateTime, int>> getSymptomHistory(String email) async {
    final db = await myDataBase;
    var result = await db!.query(
      'Symptoms',
      where: 'email = ?',
      whereArgs: [email],
    );

    Map<DateTime, int> history = {};
    for (var row in result) {
      DateTime date = DateTime.parse(row['date'] as String);

      // Extract the true severity value, fallback to 1 if null
      int severity = (row['severity'] as int?) ?? 1;

      history[date] = severity;
    }
    return history;
  }

  Future<String?> getResultForDate(String email, DateTime date) async {
    final db = await myDataBase;
    String formattedDate = date.toString().split(' ')[0];

    var result = await db!.query(
      'Symptoms',
      where: 'email = ? AND date = ?',
      whereArgs: [email, formattedDate],
    );

    if (result.isNotEmpty) {
      return result.first['result'] as String;
    }
    return null;
  }

  Future<void> insertMedication(Map<String, dynamic> medData) async {
    final db = await myDataBase;
    await db!.insert(
      'Medications',
      medData,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Map<String, dynamic>>> getMedicationsForUser(String email) async {
    final db = await myDataBase;
    return await db!.query(
      'Medications',
      where: 'userEmail = ?',
      whereArgs: [email],
    );
  }

  Future<void> deleteMedication(int id) async {
    final db = await myDataBase;
    await db!.delete(
      'Medications',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
