import 'package:flutter/material.dart';
import 'package:gluco_track/resources/components/round_button.dart';
import 'package:gluco_track/view/glucose_entries_screen.dart';
import 'package:gluco_track/view_model/hba1c_calculate_vm.dart';
import 'package:provider/provider.dart';
import '../resources/components/custom_appbar.dart';
import '../resources/components/size_config.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_fonts.dart';
import 'bottom_navbar_screen.dart';
import '../utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserInputScreen extends StatefulWidget {
  @override
  _UserInputScreenState createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  TextEditingController glucoseController = TextEditingController();
  TextEditingController insulinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final sc = ScreenConfig(context);
    var pop = AppFonts.poppins;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomAppBar(
              title: AppLocalizations.of(context)!.enterData,
              rightIcon: Icons.receipt,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GlucoseEntriesScreen(),
                    ));
              },
            ),
          ),
          SizedBox(height: sc.height(100)),
          Expanded(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Glucose Input Field
                      buildInputField(
                        context: context,
                        controller: glucoseController,
                        label: AppLocalizations.of(context)!.glucoseLvl,
                        icon: Icons.bloodtype,
                        min: 40,
                        max: 600,
                        errorMessage: AppLocalizations.of(context)!.glucosEntryError,
                      ),
                      SizedBox(height: sc.height(20)),

                      // Insulin Input Field
                      buildInputField(
                        context: context,
                        controller: insulinController,
                        label: AppLocalizations.of(context)!.insulinLvl,
                        icon: Icons.healing,
                        min: 0.5,
                        max: 100,
                        errorMessage: AppLocalizations.of(context)!.insulinEntryError,
                      ),
                      SizedBox(height: sc.height(20)),

                      // Enter Button
                      RoundButton(
                        title: AppLocalizations.of(context)!.enter,
                        onPress: () async {
                          if (_formKey.currentState!.validate()) {
                            double glucoseValue = double.parse(glucoseController.text);
                            double insulinValue = double.parse(insulinController.text);

                            if (glucoseValue < 50 || glucoseValue > 400) {
                              Utils.toastMessage(AppLocalizations.of(context)!.glucoseLevelWarning);
                            }

                            var hba1cVm = Provider.of<Hba1cCalculateVm>(context, listen: false);
                            if (hba1cVm.isLoading) return;

                            bool isEntryAdded = await hba1cVm.addGlucoseEntry(glucoseValue, insulinValue);
                            if (isEntryAdded) {
                              Utils.toastMessage(AppLocalizations.of(context)!.dataSubmit);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavbarScreen(initialIndex: 0),
                                ),
                              );
                            } else {
                              Utils.flushBarErrorMessage(AppLocalizations.of(context)!.todayData, context);
                            }
                          }
                        },
                      ),

                      SizedBox(height: sc.height(20)),
                      Container(
                        width: sc.width(400),
                        height: sc.height(100),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.25),
                            border: Border.all(color: AppColors.primaryColor)),
                        child: Center(
                            child: Text(
                                style: TextStyle(fontFamily: pop, fontSize: sc.text(14)),
                                textAlign: TextAlign.center,
                                AppLocalizations.of(context)!.infoEntry)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField({
    required BuildContext context,
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required double min,
    required double max,
    required String errorMessage,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor,
          ),
          prefixIcon: Icon(icon, color: AppColors.primaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          final double? number = double.tryParse(value);
          if (number == null || number < min || number > max) {
            // Fetch the localized string and provide arguments for min and max
            return AppLocalizations.of(context)!.rangeValueError(min, max);
          }
          return null;
        },
      ),
    );
  }
}
