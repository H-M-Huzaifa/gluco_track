// import 'package:flutter/material.dart';
// import 'package:gluco_track/resources/components/round_button.dart';
// import 'package:gluco_track/view_model/pageview_vm.dart';
// import 'package:provider/provider.dart';
//
// import '../../resources/components/blue_curve_painter.dart';
// import '../../resources/components/size_config.dart';
// import '../../utils/constants/app_colors.dart';
// import '../../utils/constants/app_fonts.dart';
//
// class Onboarding1 extends StatefulWidget {
//   const Onboarding1({super.key});
//
//   @override
//   State<Onboarding1> createState() => _Onboarding1State();
// }
//
// class _Onboarding1State extends State<Onboarding1> {
//   int? selectedIndex; // variable to track selected index
//
//   @override
//   Widget build(BuildContext context) {
//     var pop=AppFonts.poppins;
//
//     SizeConfig.init(context);
//     BlueCurvePainter curve = BlueCurvePainter();
//
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       body: Stack(
//         children: [
//           // Curve
//           CustomPaint(
//             size: Size(SizeConfig.screenWidth, SizeConfig.screenHeight),
//             painter: curve,
//           ),
//
//           Positioned(
//             top: SizeConfig.fixedTextSize(50),
//             left: SizeConfig.fixedTextSize(20),
//             child: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: const Icon(
//                 Icons.arrow_back,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Step text
//               Padding(
//                 padding: const EdgeInsets.only(top: 150),
//                 child: Text(
//                   "Step 1 of 5",
//                   style: TextStyle(
//                     fontFamily: pop,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.primaryColor,
//                     fontSize: SizeConfig.fixedTextSize(25),
//                   ),
//                 ),
//               ),
//
//               // Question text
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Text(textAlign: TextAlign.center,
//                   '"What is your age group?"',
//                   style: TextStyle(
//                     fontFamily: pop,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.defaultfont,
//                     fontSize: SizeConfig.fixedTextSize(30),
//                   ),
//                 ),
//               ),
//
//               const Spacer(),
//
//               // Bottom container with options
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: AppColors.primaryColor),
//                   borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(60),
//                     topLeft: Radius.circular(60),
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Age options
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = 0; // Set selected index
//                         });
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//                         margin: const EdgeInsets.symmetric(vertical: 8),
//                         decoration: BoxDecoration(
//                           color: selectedIndex == 0 ? AppColors.primaryColor : Colors.white,
//                           border: Border.all(
//                             color: selectedIndex == 0 ? AppColors.primaryColor : AppColors.defaultfont,
//                           ),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Text(
//                           'below >18',
//                           style: TextStyle(
//                             fontFamily: pop,
//                             fontWeight: FontWeight.bold,
//                             fontSize: SizeConfig.fixedTextSize(20),
//                             color: selectedIndex == 0 ? Colors.white : AppColors.defaultfont,
//                           ),
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = 1; // Set selected index
//                         });
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//                         margin: const EdgeInsets.symmetric(vertical: 8),
//                         decoration: BoxDecoration(
//                           color: selectedIndex == 1 ? AppColors.primaryColor : Colors.white,
//                           border: Border.all(
//                             color: selectedIndex == 1 ? AppColors.primaryColor : AppColors.defaultfont,
//                           ),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Text(
//                           '[18-30] years old',
//                           style: TextStyle(
//                             fontFamily: pop,
//                             fontWeight: FontWeight.bold,
//                             fontSize: SizeConfig.fixedTextSize(20),
//                             color: selectedIndex == 1 ? Colors.white : AppColors.defaultfont,
//                           ),
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = 2; // Set selected index
//                         });
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//                         margin: const EdgeInsets.symmetric(vertical: 8),
//                         decoration: BoxDecoration(
//                           color: selectedIndex == 2 ? AppColors.primaryColor : Colors.white,
//                           border: Border.all(
//                             color: selectedIndex == 2 ? AppColors.primaryColor : AppColors.defaultfont,
//                           ),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Text(
//                           '[31-40] years old',
//                           style: TextStyle(
//                             fontFamily: pop,
//                             fontWeight: FontWeight.bold,
//                             fontSize: SizeConfig.fixedTextSize(20),
//                             color: selectedIndex == 2 ? Colors.white : AppColors.defaultfont,
//                           ),
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = 3; // Set selected index
//                         });
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//                         margin: const EdgeInsets.symmetric(vertical: 8),
//                         decoration: BoxDecoration(
//                           color: selectedIndex == 3 ? AppColors.primaryColor : Colors.white,
//                           border: Border.all(
//                             color: selectedIndex == 3 ? AppColors.primaryColor : AppColors.defaultfont,
//                           ),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Text(
//                           '[41-50] years old',
//                           style: TextStyle(
//                             fontFamily: pop,
//                             fontWeight: FontWeight.bold,
//                             fontSize: SizeConfig.fixedTextSize(20),
//                             color: selectedIndex == 3 ? Colors.white : AppColors.defaultfont,
//                           ),
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = 4; // Set selected index
//                         });
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//                         margin: const EdgeInsets.symmetric(vertical: 8),
//                         decoration: BoxDecoration(
//                           color: selectedIndex == 4 ? AppColors.primaryColor : Colors.white,
//                           border: Border.all(
//                             color: selectedIndex == 4 ? AppColors.primaryColor : AppColors.defaultfont,
//                           ),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Text(
//                           '50 years and above',
//                           style: TextStyle(
//                             fontFamily: pop,
//                             fontWeight: FontWeight.bold,
//                             fontSize: SizeConfig.fixedTextSize(20),
//                             color: selectedIndex == 4 ? Colors.white : AppColors.defaultfont,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.only(top: 30, bottom: 10, right: 10), // Add spacing between buttons
//                       child: Consumer<PageviewVm>(
//                         builder: (context, vm, child) {
//                           return Container(
//                             height: SizeConfig.fixedTextSize(50),
//                             width: SizeConfig.fixedTextSize(190), // Set width to 190
//                             child: RoundButton(
//                               title: "Next",
//                               onPress: () {
//                                 if (selectedIndex != null) {
//                                   // Proceed only if an option is selected
//                                   vm.nextPage();
//                                 } else {
//                                   // Show a message if no option is selected
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                       content: Text('Select age group',style: TextStyle(color: Colors.white),),
//                                       backgroundColor: Colors.red,
//                                     ),
//                                   );
//                                 }
//                               },
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
