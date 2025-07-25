// import 'package:flutter/material.dart';
// import 'package:gluco_track/resources/components/round_button.dart';
// import 'package:provider/provider.dart';
//
// import '../../resources/components/blue_curve_painter.dart';
// import '../../resources/components/size_config.dart';
// import '../../utils/constants/app_colors.dart';
// import '../../utils/constants/app_fonts.dart';
// import '../../view_model/pageview_vm.dart';
//
// class Onboarding2 extends StatefulWidget {
//   const Onboarding2({super.key});
//
//   @override
//   State<Onboarding2> createState() => _Onboarding2State();
// }
//
// class _Onboarding2State extends State<Onboarding2> {
//   // Track selected diabetes type
//   int? selectedIndex;
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
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//
//               // Steps
//               Padding(
//                 padding: const EdgeInsets.only(top: 150),
//                 child: Text(
//                   "Step 2 of 5",
//                   style: TextStyle(
//                       fontFamily: pop,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.primaryColor,
//                       fontSize: SizeConfig.fixedTextSize(25)),
//                 ),
//               ),
//
//               // Question
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 35),
//                 child: Text(
//                   textAlign: TextAlign.center,
//                   '"Do you have Type 1 or Type 2 diabetes?"',
//                   style: TextStyle(
//                       fontFamily: pop,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.defaultfont,
//                       fontSize: SizeConfig.fixedTextSize(30)),
//                 ),
//               ),
//
//               Spacer(),
//               Container(
//                 width: double.infinity,
//                 height: SizeConfig.fixedTextSize(500),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: AppColors.primaryColor),
//                     borderRadius: BorderRadius.only(topRight: Radius.circular(60), topLeft: Radius.circular(60))),
//
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Type 1 Option
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = 0; // Type 1
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
//                           'Type 1',
//                           style: TextStyle(
//                             fontFamily: pop,
//                             fontWeight: FontWeight.bold,
//                             fontSize: SizeConfig.fixedTextSize(20),
//                             color: selectedIndex == 0 ? Colors.white : AppColors.defaultfont,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     // Type 2 Option
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = 1; // Type 2
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
//                           'Type 2',
//                           style: TextStyle(
//                             fontFamily: pop,
//                             fontWeight: FontWeight.bold,
//                             fontSize: SizeConfig.fixedTextSize(20),
//                             color: selectedIndex == 1 ? Colors.white : AppColors.defaultfont,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     // I'm not sure Option
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = 2; // I'm not sure
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
//                           "I'm not sure",
//                           style: TextStyle(
//                             fontFamily: pop,
//                             fontWeight: FontWeight.bold,
//                             fontSize: SizeConfig.fixedTextSize(20),
//                             color: selectedIndex == 2 ? Colors.white : AppColors.defaultfont,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//
//                           // Previous Button
//                           Consumer<PageviewVm>(
//                             builder: (context, vm, child) {
//                               return InkWell(
//                                 onTap: () {
//                                   vm.previousPage();
//                                 },
//                                 child: Container(
//                                   height: SizeConfig.fixedTextSize(50),
//                                   width: SizeConfig.fixedTextSize(190), // Set width to 190
//                                   decoration: BoxDecoration(
//                                       border: Border.all(color: AppColors.primaryColor),
//                                       borderRadius: BorderRadius.circular(30)),
//                                   child: Center(
//                                       child: Text(
//                                         "Previous",
//                                         style: TextStyle(
//                                           fontFamily: pop,
//                                         ),
//                                       )),
//                                 ),
//                               );
//                             },
//                           ),
//
//                           // Next Button
//                           Consumer<PageviewVm>(
//                             builder: (context, vm, child) {
//                               return Container(
//                                 height: SizeConfig.fixedTextSize(50),
//                                 width: SizeConfig.fixedTextSize(190), // Set width to 190
//                                 child: RoundButton(
//                                   title: "Next",
//                                   onPress: () {
//                                     if (selectedIndex != null) {
//                                       // Proceed only if an option is selected
//                                       vm.nextPage();
//                                     } else {
//                                       // Show a message if no option is selected
//                                       ScaffoldMessenger.of(context).showSnackBar(
//                                         const SnackBar(
//                                           content: Text('Select your diabetes group',style: TextStyle(color: Colors.white),),
//                                           backgroundColor: Colors.red,
//                                         ),
//                                       );
//                                     }
//                                   },
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     )
//
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
