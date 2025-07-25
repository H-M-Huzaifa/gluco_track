// import 'package:flutter/material.dart';
// import 'package:gluco_track/resources/components/size_config.dart';
// import 'package:gluco_track/utils/constants/app_fonts.dart';
// import '../../utils/constants/app_colors.dart';
//
// class OnboardingButton extends StatelessWidget {
//   final String title;
//   final bool loading;
//   final VoidCallback onPress;
//
//   OnboardingButton(
//       {required this.title,
//         this.loading = false,
//         required this.onPress,
//         super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     var pop=AppFonts.poppins;
//
//     return InkWell(
//       onTap: onPress,
//       child: Container(
//         height: SizeConfig.fixedSize(50),
//         width: 190, // Fixed width as requested
//         child: Center(
//           child: loading
//               ? CircularProgressIndicator(
//             color: Colors.white,
//           )
//               : Text(
//             title,
//             style: TextStyle(fontFamily: pop, color: Colors.white),
//           ),
//         ),
//         decoration: BoxDecoration(
//             color: AppColors.primaryColor, borderRadius: BorderRadius.circular(30)),
//       ),
//     );
//   }
// }
