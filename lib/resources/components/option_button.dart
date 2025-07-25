import 'package:flutter/material.dart';
import 'package:gluco_track/resources/components/size_config.dart';

import '../../utils/constants/app_colors.dart';

class OptionButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;
  final String poppins;

  const OptionButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
    required this.poppins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sc = ScreenConfig(context);

    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.defaultfont,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: poppins,
            fontWeight: FontWeight.bold,
            fontSize: sc.text(20),
            color: isSelected ? Colors.white : AppColors.defaultfont,
          ),
        ),
      ),
    );
  }
}
