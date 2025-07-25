import 'package:flutter/material.dart';

import '../model/db_helper.dart';

class GlucoseEntry {
  final double value; // Glucose value
  final DateTime timestamp;
  final double insulinValue; // New field for insulin

  GlucoseEntry(this.value, this.timestamp, {this.insulinValue = 0});
}


class Hba1cCalculateVm with ChangeNotifier {
  final List<GlucoseEntry> _glucoseEntries = [];
  final int _minimumRequiredEntries = 7;
  final DbHelper _dbHelper = DbHelper();

  bool _isLoading = false; // Loading state variable
  bool get isLoading => _isLoading;

  Hba1cCalculateVm() {
    _loadGlucoseEntries();
  }

  /// Load glucose entries from local storage
  Future<void> _loadGlucoseEntries() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<GlucoseEntry> entries = await _dbHelper.getGlucoseEntries();
      _glucoseEntries.addAll(entries);
    } catch (e) {
      print('Error loading glucose entries: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Get glucose entries
  List<GlucoseEntry> get glucoseEntries => List.unmodifiable(_glucoseEntries);

  // Get remaining entries count
  int get remainingEntries => _glucoseEntries.length < _minimumRequiredEntries
      ? _minimumRequiredEntries - _glucoseEntries.length
      : 0;

  // Add a new glucose entry
  Future<bool> addGlucoseEntry(double glucoseValue, double insulinValue) async {
    // Check if an entry already exists for today
    if (_glucoseEntries.any((entry) =>
    entry.timestamp.year == DateTime.now().year &&
        entry.timestamp.month == DateTime.now().month &&
        entry.timestamp.day == DateTime.now().day)) {
      // If an entry exists, return false
      return false;
    }

    // Add the new entry if no entry exists for today
    GlucoseEntry newEntry = GlucoseEntry(glucoseValue, DateTime.now(), insulinValue: insulinValue);
    _glucoseEntries.add(newEntry);

    // Save the entry to the local database
    await _dbHelper.insertGlucoseEntry(glucoseValue, DateTime.now(), insulinValue);

    notifyListeners();
    return true; // Entry successfully added
  }

  /// Check if the minimum number of entries is met
  bool get isReadyToCalculate => _glucoseEntries.length >= _minimumRequiredEntries;

  /// Reset function to delete all entries
  Future<void> reset() async {
    _glucoseEntries.clear();
    await _dbHelper.deleteAllEntries();
    notifyListeners();
  }

  /// Calculate HbA1c based on the glucose entries
  double calculateHbA1c() {
    if (_glucoseEntries.length >= _minimumRequiredEntries) {
      double averageGlucose = _glucoseEntries
          .map((entry) => entry.value)
          .reduce((a, b) => a + b) /
          _glucoseEntries.length;
      return (averageGlucose + 46.7) / 28.7;
    } else {
      throw Exception("Not enough data to calculate HbA1c. Add at least 7 entries.");
    }
  }

  List<Map<String, dynamic>> getFilteredEntries(String timePeriod) {
    final now = DateTime.now();
    DateTime startDate;

    if (timePeriod == 'lastWeek') {
      startDate = now.subtract(Duration(days: 7));
    } else if (timePeriod == 'twoWeeks') {
      startDate = now.subtract(Duration(days: 14));
    } else if (timePeriod == 'oneMonth') {
      startDate = now.subtract(Duration(days: 30));
    } else if (timePeriod == 'tillToday') {
      // If 'tillNow', include all entries by setting the startDate to the earliest possible date.
      startDate = DateTime.fromMillisecondsSinceEpoch(0);
    } else {
      throw ArgumentError('Invalid time period: $timePeriod');
    }

    return glucoseEntries
        .where((entry) => entry.timestamp.isAfter(startDate))
        .map((entry) => {
      'day': glucoseEntries.indexOf(entry) + 1,
      'glucose': entry.value,
      'insulin': entry.insulinValue,
      'timestamp':
      "${entry.timestamp.day}/${entry.timestamp.month}/${entry.timestamp.year} ${entry.timestamp.hour}:${entry.timestamp.minute.toString().padLeft(2, '0')}"
    })
        .toList();
  }


}

