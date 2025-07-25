import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

import '../view_model/hba1c_calculate_vm.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance;

  static Database? _database;

  DbHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      String path = join(await getDatabasesPath(), 'glucose_entries.db');
      print("Opening database at path: $path"); // Debugging line
      return openDatabase(path, onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE GlucoseEntries(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            value REAL,
            timestamp INTEGER,
            insulinValue REAL
          )
        ''');
      }, version: 1);
    } catch (e) {
      print("Error initializing database: $e");
      rethrow;
    }
  }

  // Insert a new glucose entry
  Future<void> insertGlucoseEntry(double value, DateTime timestamp, double insulinValue) async {
    try {
      final db = await database;
      await db.insert('GlucoseEntries', {
        'value': value,
        'timestamp': timestamp.millisecondsSinceEpoch,
        'insulinValue': insulinValue,
      });
      print("Data inserted successfully: $value, $timestamp, $insulinValue"); // Debugging line
    } catch (e) {
      print("Error inserting glucose entry: $e");
    }
  }

  // Get all glucose entries
  Future<List<GlucoseEntry>> getGlucoseEntries() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('GlucoseEntries');
      print("Fetched glucose entries: ${maps.length}"); // Debugging line
      return List.generate(maps.length, (i) {
        return GlucoseEntry(
          maps[i]['value'],
          DateTime.fromMillisecondsSinceEpoch(maps[i]['timestamp']),
          insulinValue: maps[i]['insulinValue'],
        );
      });
    } catch (e) {
      print("Error fetching glucose entries: $e");
      return []; // Return empty list if there's an error
    }
  }

  // Clear all glucose entries
  Future<void> deleteAllEntries() async {
    try {
      final db = await database;
      await db.delete('GlucoseEntries');
      print("All entries deleted"); // Debugging line
    } catch (e) {
      print("Error deleting glucose entries: $e");
    }
  }
}
