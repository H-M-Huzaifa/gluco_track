import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants/app_colors.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.primaryColor, // Set the background color to your primary color
      textColor: Colors.white, // White text for contrast
      gravity: ToastGravity.BOTTOM, // Toast appears at the bottom of the screen
      toastLength: Toast.LENGTH_SHORT, // Duration of the toast
    );
  }

  // Moves to next textfield using ENTER
  static textfieldFocusChange (BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        flushbarPosition: FlushbarPosition.TOP,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: Icon(
          Icons.info_outline,
          color: Colors.white,
        ),
        backgroundColor: AppColors.primaryColor, // Using primary color
        duration: Duration(seconds: 3),
        message: message,
        messageColor: Colors.white, // White text for contrast
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white), // White text for contrast
        ),
        backgroundColor: AppColors.primaryColor, // Primary color for SnackBar
        duration: Duration(seconds: 3), // Duration of SnackBar
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners for the SnackBar
        ),
        behavior: SnackBarBehavior.floating, // Floating SnackBar
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Margins
      ),
    );
  }
}
