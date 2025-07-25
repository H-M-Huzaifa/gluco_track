import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gluco_track/utils/constants/app_colors.dart';

class BlueCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width, 0); // Start at the top-right corner
    path.quadraticBezierTo(

      size.width * 0.3, // Control point X (middle of the screen width)

      size.height * 0, // Control point Y (slightly above the screen)

      0, // End point X (left edge)

      size.height * 0.3, // End point Y (30% height on the left)
    );
    path.lineTo(0, 0); // Move to the top-left corner
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
