import 'package:flutter/material.dart';
import 'package:gluco_track/resources/components/custom_appbar.dart';
import 'package:gluco_track/resources/components/round_button.dart';
import 'package:gluco_track/resources/components/size_config.dart';
import 'package:gluco_track/view/glucose_entries_screen.dart';
import 'package:provider/provider.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_fonts.dart';
import '../utils/constants/assets.dart';
import '../utils/generate_pdf.dart';
import '../view_model/hba1c_calculate_vm.dart';
import '../utils/utils.dart'; // Import your Utils class
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class PdfReportScreen extends StatefulWidget {
  const PdfReportScreen({super.key});

  @override
  State<PdfReportScreen> createState() => _PdfReportScreenState();
}

class _PdfReportScreenState extends State<PdfReportScreen> {
  String? selectedValue;

  @override
  var pop = AppFonts.poppins;
  Widget build(BuildContext context) {
    var cabin = AppFonts.cabin;
    final sc = ScreenConfig(context);

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // App bar
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  GlucoseEntriesScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child:  CustomAppBar(
                  title: AppLocalizations.of(context)!.generateHealthReport,
                  rightIcon: Icons.info,
                ),
              ),
            ),

            // PDF image
            Image.asset(
              Assets.pdf,
              width: sc.width(250),
            ),

            // Select Time Period
            Container(
              width: sc.width(400),
              height: sc.height(300),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  const BoxShadow(
                    spreadRadius: -2,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.selectTime,
                    style: TextStyle(
                      fontFamily: pop,
                      color: AppColors.primaryColor,
                      fontSize: sc.text(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: sc.height(20) ,),

                  // Radio Buttons for Time Period Selection
                  _buildRadioOption('lastWeek', AppLocalizations.of(context)!.lastweek),
                  _buildRadioOption('twoWeeks', AppLocalizations.of(context)!.twoweek),
                  _buildRadioOption('oneMonth', AppLocalizations.of(context)!.month),
                  _buildRadioOption('tillToday', AppLocalizations.of(context)!.tillToday),
                ],
              ),
            ),

            // Info Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                width: sc.width(400),
                height: sc.height(100),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.25),
                  border: Border.all(color: AppColors.primaryColor),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.infoReportMsg,
                    style: TextStyle(fontFamily: pop, fontSize: sc.text(14)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            // Export Button
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: RoundButton(
                title: AppLocalizations.of(context)!.export,
                onPress: () async {
                  if (selectedValue == null) {
                    // Use Flushbar instead of SnackBar for error message
                    Utils.flushBarErrorMessage(AppLocalizations.of(context)!.errorTime, context);
                    return;
                  }

                  final provider = Provider.of<Hba1cCalculateVm>(context, listen: false);
                  final entries = provider.getFilteredEntries(selectedValue!);

                  if (entries.isEmpty) {
                    // Use Flushbar instead of SnackBar for error message
                    Utils.flushBarErrorMessage(AppLocalizations.of(context)!.errorEntries, context);
                    return;
                  }

                  bool isProcessing = true;
                  try {
                    // Show processing message using Flushbar
                    Utils.flushBarErrorMessage(AppLocalizations.of(context)!.errorGenerating, context);
                    await generatePdfReport(entries, selectedValue!);

                    // Show success message using Flushbar
                    Utils.flushBarErrorMessage(AppLocalizations.of(context)!.errorFolder, context);
                  } catch (e) {
                    // Show error message using Flushbar
                    Utils.flushBarErrorMessage(AppLocalizations.of(context)!.errorFailed+"$e", context);
                  } finally {
                    isProcessing = false;
                  }
                },
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption(String value, String label,) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedValue = value;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio<String>(
            value: value,
            groupValue: selectedValue,
            onChanged: (newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
          ),
          Text(
            label,
            style: TextStyle(fontFamily: pop),
          ),
        ],
      ),
    );
  }
}
