import 'package:flutter/material.dart';
import 'package:gluco_track/resources/components/size_config.dart';
import 'package:gluco_track/utils/constants/app_fonts.dart';

import '../../utils/constants/app_colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  RoundButton(
      {required this.title,
      this.loading = false,
      required this.onPress,
      super.key});

  @override
  Widget build(BuildContext context) {
    final sc = ScreenConfig(context);
    var pop = AppFonts.poppins;

    return InkWell(
      onTap: onPress,
      child: Container(
        height: sc.height(50),
        width: sc.width(400),
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(
                        fontFamily: pop, color: Colors.white),
                  )),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
