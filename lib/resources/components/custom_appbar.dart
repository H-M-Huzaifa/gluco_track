import 'package:flutter/material.dart';
import 'package:gluco_track/resources/components/size_config.dart';
import 'package:gluco_track/utils/constants/app_fonts.dart';
import '../../utils/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData rightIcon; // Parameter for the right button's icon
  final VoidCallback? onPressed; // Parameter for the right button's onPressed functionality

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.rightIcon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pop = AppFonts.poppins;
    final sc = ScreenConfig(context);


    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.transparent, // Background can match the screen
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Back button
          // InkWell(
          //   onTap: () {
          //     Navigator.pop(context); // Default back functionality
          //   },
          //   child: Container(
          //     width: 40,
          //     height: 40,
          //     decoration: BoxDecoration(
          //       color: const Color(0xFF2980B9), // Back button color
          //       shape: BoxShape.circle,
          //     ),
          //     child: const Icon(
          //       Icons.arrow_back, // Back icon
          //       color: Colors.white,
          //       size: 24,
          //     ),
          //   ),
          // ),


          SizedBox(width: sc.width(40)),

          // Middle container
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontFamily: pop,
                fontSize: sc.text(16),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Right Button
          InkWell(
            onTap: onPressed, // Calls the provided onPressed function
            child: Container(
              width: sc.width(40),
              height: sc.height(40),
              decoration: BoxDecoration(
                color: const Color(0xFF2980B9), // Right button color
                shape: BoxShape.circle,
              ),
              child: Icon(
                rightIcon, // Uses the provided icon
                color: Colors.white,
                size: sc.width(24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
