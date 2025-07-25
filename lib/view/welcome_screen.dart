import 'package:flutter/material.dart';
import 'package:gluco_track/resources/components/blue_curve_painter.dart';
import 'package:gluco_track/utils/Routes/routes_names.dart';
import 'package:gluco_track/utils/constants/app_colors.dart';
import 'package:gluco_track/utils/constants/app_fonts.dart';
import 'package:gluco_track/resources/components/round_button.dart';
import 'package:gluco_track/resources/components/size_config.dart';
import 'package:gluco_track/utils/constants/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {

    var pop=AppFonts.poppins;
    final sc = ScreenConfig(context);

    BlueCurvePainter curve=BlueCurvePainter();

    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body:
        Stack(children: [

          //Curve
          CustomPaint(
            size: Size(sc.width(double.infinity), sc.height(double.infinity)),
            painter: curve,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 200),
                child: Container(child: Column(
                  children: [
                    Image.asset(
                      Assets.logo,
                      width: sc.width(150),
                    ),
                    Text(AppLocalizations.of(context)!.yourDiabetesInCheck,
                        style: TextStyle(
                          fontFamily: pop,
                        )),
                  ],
                ),
                ),
              ),
              Spacer(),

              Center(
                child: RichText(textAlign: TextAlign.center,
                    maxLines: 2,
                    text: TextSpan(children: [
                      TextSpan(
                          text: AppLocalizations.of(context)!.welcomeToGlucoTrack,
                          style: TextStyle(color: AppColors.defaultfont,fontSize: sc.text(15), fontFamily: pop, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: AppLocalizations.of(context)!.diabetesTrackingApp,
                          style: TextStyle(color: AppColors.defaultfont,fontSize: sc.text(15), fontFamily: pop)),
                    ])),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: RoundButton(title: AppLocalizations.of(context)!.getStarted, onPress: (){
                  Navigator.pushNamed(context, RoutesNames.bottomnavbar);
                }),
              )
            ],
          )
        ],),
        );
  }
}
