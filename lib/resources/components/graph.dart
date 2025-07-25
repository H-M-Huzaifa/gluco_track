import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gluco_track/resources/components/size_config.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/app_fonts.dart';
import '../../view_model/hba1c_calculate_vm.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeeklyTrendsGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenConfig
    final sc = ScreenConfig(context);
    var pop = AppFonts.poppins;

    // Fetch the glucose entries from the provider
    var glucoseEntries = Provider.of<Hba1cCalculateVm>(context).glucoseEntries;

    // Check if there are no glucose entries
    if (glucoseEntries.isEmpty) {
      return Center(
        child: Text(
          textAlign: TextAlign.center,
          AppLocalizations.of(context)!.noGlucoseData,
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: pop, fontSize: sc.text(16), color: Colors.red),
        ),
      );
    }

    // Limit the list to the last 7 entries
    glucoseEntries = glucoseEntries.length > 7
        ? glucoseEntries.sublist(glucoseEntries.length - 7) // Get last 7 entries
        : glucoseEntries; // If less than 7, keep all entries

    // Get glucose values and corresponding days for the last 7 days
    List<double> glucoseLevels = glucoseEntries.map((entry) => entry.value).toList();
    List<String> days = glucoseEntries.map((entry) {
      return getDayOfWeek(entry.timestamp); // Get day name from timestamp
    }).toList();

    return Container(
      height: calculateGraphHeight(sc, glucoseEntries), // Updated height
      child: LineChart(
        LineChartData(
          minX: 1,
          maxX: glucoseEntries.length.toDouble(),
          minY: 50,
          maxY: 400,
          titlesData: FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Disable top titles
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 100,
                reservedSize: 50,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1, // Ensure X-axis values increment by 1
                getTitlesWidget: (value, meta) {
                  int index = value.toInt() - 1; // Adjust index to match the days list
                  if (index >= 0 && index < days.length) {
                    return Text(
                      days[index], // Use the day name for the X-axis label
                      style: TextStyle(fontSize: sc.text(12)),
                    );
                  }
                  return const SizedBox(); // Return empty widget for out-of-range indices
                },
                reservedSize: 32,
              ),
            ),
          ),
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: true, border: Border.all(color: Color(0xff2980B9), width: 1)),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(glucoseLevels.length, (index) {
                return FlSpot((index + 1).toDouble(), glucoseLevels[index]); // Use integer x values
              }),
              isCurved: true,
              color: Color(0xff2980B9),
              barWidth: 3,
              belowBarData: BarAreaData(
                show: true,
                color: Color(0xff2980B9).withOpacity(0.3),
              ),
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to calculate graph height
  double calculateGraphHeight(ScreenConfig sc, List<GlucoseEntry> glucoseEntries) {
    if (glucoseEntries.isEmpty) {
      return sc.height(200); // Default height in device-independent pixels
    }

    double maxValue = glucoseEntries.map((e) => e.value).reduce((a, b) => a > b ? a : b);

    // Ensure the height grows proportionally if values exceed the base height
    return sc.height(200) + ((maxValue - 200).clamp(0, double.infinity) * sc.height(1.5));
  }

  // Helper function to get the day of the week from DateTime
  String getDayOfWeek(DateTime timestamp) {
    switch (timestamp.weekday) {
      case DateTime.monday:
        return 'M';
      case DateTime.tuesday:
        return 'T';
      case DateTime.wednesday:
        return 'W';
      case DateTime.thursday:
        return 'T';
      case DateTime.friday:
        return 'F';
      case DateTime.saturday:
        return 'S';
      case DateTime.sunday:
        return 'S';
      default:
        return '';
    }
  }
}
