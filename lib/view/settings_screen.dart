import 'package:flutter/material.dart';
import 'package:gluco_track/resources/components/custom_appbar.dart';
import 'package:gluco_track/view/faq_screen.dart';
import 'package:gluco_track/view/feedback_suggestions_screen.dart';
import 'package:gluco_track/view_model/language_change_vm.dart';
import 'package:provider/provider.dart';

import '../resources/components/size_config.dart';
import '../utils/constants/app_colors.dart';
import '../utils/constants/app_fonts.dart';
import 'contact_support_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Language { English, Urdu }

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final sc = ScreenConfig(context);

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomAppBar(title: AppLocalizations.of(context)!.settings, rightIcon: Icons.sunny),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  // Language Settings
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child:
                    Text(AppLocalizations.of(context)!.langPref
                      ,
                      style: SettingsTextStyle.myStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.selectLang,
                          style: SettingsTextStyle.myStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                        Consumer<LanguageChangeVm>(
                          builder: (context, vm, child) {
                            return PopupMenuButton<Language>(
                              onSelected: (Language value) {
                                if(Language.English.name==value.name){
                                  vm.changeLanguage(Locale('en'));
                                }else{
                                  vm.changeLanguage(Locale('ur'));

                                }
                              },
                              itemBuilder: (BuildContext context) => [
                                const PopupMenuItem(
                                  value: Language.English,
                                  child: Text("English"),
                                ),
                                const PopupMenuItem(
                                  value: Language.Urdu,
                                  child: Text("اردو"),
                                ),
                              ],
                              child: Row(
                                children: [
                                  Text(
                                    vm.appLocale?.languageCode == 'en' ? "English" : "اردو",
                                    style: SettingsTextStyle.myStyle(
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  const Icon(Icons.arrow_drop_down, color: AppColors.primaryColor),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(),

                  // Reminders
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      AppLocalizations.of(context)!.reminder,
                      style: SettingsTextStyle.myStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigate to Glucose Reminder Screen
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        AppLocalizations.of(context)!.glucoseCheck,
                        style: SettingsTextStyle.myStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  Divider(),

                  // Support & Help
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      AppLocalizations.of(context)!.supportHelp,
                      style: SettingsTextStyle.myStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FAQScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        AppLocalizations.of(context)!.fAQ,
                        style: SettingsTextStyle.myStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactSupportScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        AppLocalizations.of(context)!.contactSupport,
                        style: SettingsTextStyle.myStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => FeedbackSuggestionsScreen()),
                  //     );
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(10),
                  //     child: Text(
                  //       "Feedback and Suggestions",
                  //       style: SettingsTextStyle.myStyle(
                  //         fontWeight: FontWeight.normal,
                  //         color: Colors.black.withOpacity(0.7),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsTextStyle {
  static TextStyle myStyle({required FontWeight fontWeight, required Color color}) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: fontWeight,
      fontFamily: AppFonts.poppins,
    );
  }
}
