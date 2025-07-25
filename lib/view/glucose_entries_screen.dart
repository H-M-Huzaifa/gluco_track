import 'package:flutter/material.dart';
import 'package:gluco_track/resources/components/custom_appbar.dart';
import 'package:provider/provider.dart';
import '../utils/constants/app_colors.dart';
import '../view_model/hba1c_calculate_vm.dart';
import '../utils/utils.dart'; // Import your Utils class
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class GlucoseEntriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomAppBar(
              title: AppLocalizations.of(context)!.glucoseEntriesTitle,
              rightIcon: Icons.restore,
              onPressed: () {
                // Reset the entries in your ViewModel
                Provider.of<Hba1cCalculateVm>(context, listen: false).reset();

                // Replace Snackbar with Flushbar
                Utils.flushBarErrorMessage(AppLocalizations.of(context)!.allEntriesReset, context);
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Consumer<Hba1cCalculateVm>(
                builder: (context, provider, child) {
                  final entries = provider.glucoseEntries;

                  if (entries.isEmpty) {
                    return Text(
                      AppLocalizations.of(context)!.noEntriesYet,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    );
                  }

                  return SingleChildScrollView(
                    child: DataTable(
                      columns:  [
                        DataColumn(
                          label: Text(
                            AppLocalizations.of(context)!.daysColumn,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            AppLocalizations.of(context)!.glucose,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            AppLocalizations.of(context)!.insulin,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            AppLocalizations.of(context)!.dateTimeColumn,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        entries.length,
                            (index) {
                          final entry = entries[index];
                          return DataRow(
                            cells: [
                              DataCell(Text((index + 1).toString())),
                              DataCell(Text(entry.value.toStringAsFixed(1))),
                              DataCell(Text(entry.insulinValue.toString())),
                              DataCell(
                                Text(
                                  "${entry.timestamp.day}/${entry.timestamp.month}/${entry.timestamp.year} ${entry.timestamp.hour}:${entry.timestamp.minute.toString().padLeft(2, '0')}",
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
