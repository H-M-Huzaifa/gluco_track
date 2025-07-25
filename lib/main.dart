import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gluco_track/utils/Routes/routes.dart';
import 'package:gluco_track/utils/Routes/routes_names.dart';
import 'package:gluco_track/utils/constants/app_colors.dart';
import 'package:gluco_track/utils/local_notifications.dart';
import 'package:gluco_track/view/bottom_navbar_screen.dart';
import 'package:gluco_track/view/noti_check.dart';
import 'package:gluco_track/view_model/hba1c_calculate_vm.dart';
import 'package:gluco_track/view_model/language_change_vm.dart';
import 'package:gluco_track/view_model/pageview_vm.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get language from SharedPreferences
  SharedPreferences sp = await SharedPreferences.getInstance();
  final String languageCode = sp.getString('language_code') ?? 'en';

  // Lock screen orientation to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp(locale: languageCode));
}

class MyApp extends StatelessWidget {
  final String locale;

  const MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageviewVm()),
        ChangeNotifierProvider(create: (context) => Hba1cCalculateVm()),
        ChangeNotifierProvider(create: (context) => LanguageChangeVm()),
      ],
      child: Consumer<LanguageChangeVm>(
        builder: (context, vm, child) {
          // Set the initial language based on locale from SharedPreferences
          if (vm.appLocale == null) {
            vm.changeLanguage(Locale(locale));
          }

          return MaterialApp(
            locale: vm.appLocale ?? Locale('en'), // Use the language set in LanguageChangeVm
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'), // English
              Locale('ur'), // Urdu
            ],
            debugShowCheckedModeBanner: false,
            title: 'Gluco Track',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
              useMaterial3: true,
            ),
            initialRoute: RoutesNames.splash,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
