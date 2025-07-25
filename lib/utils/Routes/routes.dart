import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gluco_track/utils/Routes/routes_names.dart';
import 'package:gluco_track/view/Onboarding_Screens/pageview_screen.dart';
import 'package:gluco_track/view/bottom_navbar_screen.dart';
import 'package:gluco_track/view/pdf_report_screen.dart';
import 'package:gluco_track/view/settings_screen.dart';
import 'package:gluco_track/view/welcome_screen.dart';
import 'package:gluco_track/view/splash_screen.dart';

import '../../view/home_screen.dart';
import '../../view/login_screen.dart';
import '../../view/signup_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){

      case RoutesNames.splash:
        return MaterialPageRoute(builder: (BuildContext context) => SplashScreen(),);

      // case RoutesNames.login:
      //   return MaterialPageRoute(builder: (BuildContext context) => LoginScreen(),);

      // case RoutesNames.signup:
      //   return MaterialPageRoute(builder: (BuildContext context) => SignupScreen(),);


      case RoutesNames.welcome:
        return MaterialPageRoute(builder: (BuildContext context) => WelcomeScreen(),);

      // case RoutesNames.pageview:
      //   return MaterialPageRoute(builder: (BuildContext context) => PageViewScreen(),);

      case RoutesNames.bottomnavbar:
        return MaterialPageRoute(builder: (BuildContext context) => BottomNavbarScreen(),);

      case RoutesNames.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen(),);

      case RoutesNames.report:
        return MaterialPageRoute(builder: (BuildContext context) => PdfReportScreen(),);

      case RoutesNames.settings:
        return MaterialPageRoute(builder: (BuildContext context) => SettingsScreen(),);




      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(child: Text("No route defined"),),
          );
        },);
    }

  }
}