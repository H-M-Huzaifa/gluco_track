import 'package:flutter/cupertino.dart';

class ScreenConfig {
  final double screenHeight;
  final double screenWidth;

  ScreenConfig(BuildContext context)
      : screenHeight = MediaQuery.of(context).size.height,
        screenWidth = MediaQuery.of(context).size.width;

  // Convert an input size to device-independent pixels for height
  double height(double inputSize) {
    // Reference screen height (e.g., 932 from Figma or design tool)
    const double referenceHeight = 932.0;
    return (inputSize / referenceHeight) * screenHeight;
  }

  // Convert an input size to device-independent pixels for width
  double width(double inputSize) {
    // Reference screen width (e.g., 430 from Figma or design tool)
    const double referenceWidth = 430.0;
    return (inputSize / referenceWidth) * screenWidth;
  }

  // Convert an input text size to device-independent pixels
  double text(double inputSize) {
    // Reference screen width for scaling text (use width for better proportionality)
    const double referenceWidth = 430.0;
    return (inputSize / referenceWidth) * screenWidth;
  }
}
