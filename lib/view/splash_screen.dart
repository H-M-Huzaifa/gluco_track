import 'package:flutter/material.dart';
import 'package:gluco_track/utils/Routes/routes_names.dart';
import 'package:gluco_track/utils/constants/app_colors.dart';

import '../resources/components/size_config.dart';
import '../utils/constants/app_fonts.dart';
import '../utils/constants/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushReplacementNamed(context, RoutesNames.welcome,
          // arguments: {
          //   'name': "mvvm"
          // }
      );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final sc = ScreenConfig(context);
    var pop=AppFonts.poppins;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
    body:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.logo,
                    width: sc.width(200),
                  ),
                  Text(AppLocalizations.of(context)!.yourDiabetesInCheck,
                      style: TextStyle(
                          fontFamily: pop,
                          fontSize: sc.text(14)
                      )),


                ],
              ),
            ),
          ),

          //Bottom Text and Image
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 20,),
          //   child: Container(
          //       child: Column(children: [
          //         Text(AppLocalizations.of(context)!.poweredBy,
          //             style: TextStyle(fontSize: sc.text(12),color: AppColors.defaultfont,fontFamily: pop)
          //           //GoogleFonts.londrinaSolid(
          //           //  color: myColors.text_se, fontSize: 20)
          //         ),
          //         Image(
          //           width: sc.width(250),
          //           image:AssetImage('assets/images/pharmapedia.png'),
          //         ),
          //       ]
          //       )
          //   ),
          // ),

        ],
      ),
    )
        // Container(
        //   width: double.maxFinite,
        //   height: double.maxFinite,
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.bottomLeft,
        //       end: Alignment.topRight,
        //       stops: [
        //         0.1,   // Start of gradient
        //         0.8,   // Middle color positioned at the center of the gradient
        //         1.0,   // End of gradient
        //       ],
        //       colors: [AppColors.primaryColor, Color(0xffC6E8FF), Colors.white],
        //     ),
        //   ),
        //   child: ,
        //
        //
        // ),
    );
  }
}
