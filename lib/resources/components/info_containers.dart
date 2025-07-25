import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:gluco_track/resources/components/size_config.dart';

class InfoContainer extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final String unit;

  InfoContainer({
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final sc = ScreenConfig(context);
    return Container(
      width: sc.text(150),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                spreadRadius: -2,
                blurRadius:4 ,
                offset: Offset(0, 4)
            ),
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: sc.text(20),
              ),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: iconColor,
                  fontWeight: FontWeight.bold,
                  fontSize: sc.text(15),
                ),
              ),
            ],
          ),
          SizedBox(height: sc.text(15)),
          RichText(
            text: TextSpan(
              text: "$value ",
              style: TextStyle(
                color: iconColor,
                fontSize: sc.text(25),
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: unit,
                  style: TextStyle(
                    color: iconColor,
                    fontSize: sc.text(10),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}