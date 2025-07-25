// import 'package:flutter/material.dart';
// import 'package:gluco_track/resources/components/round_button.dart';
// import 'package:provider/provider.dart';
//
// import '../../resources/components/blue_curve_painter.dart';
// import '../../resources/components/option_button.dart';
// import '../../resources/components/size_config.dart';
// import '../../utils/constants/app_colors.dart';
// import '../../utils/constants/app_fonts.dart';
// import '../../view_model/pageview_vm.dart';
//
// class Onboarding4 extends StatefulWidget {
//   const Onboarding4({super.key});
//
//   @override
//   State<Onboarding4> createState() => _Onboarding4State();
// }
//
// class _Onboarding4State extends State<Onboarding4> {
//   final TextEditingController hbA1cController = TextEditingController();
//
//   @override
//   void dispose() {
//     hbA1cController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     var pop=AppFonts.poppins;
//
//     var cabin = AppFonts.cabin;
//     SizeConfig.init(context);
//     BlueCurvePainter curve = BlueCurvePainter();
//
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       body: Stack(
//         children: [
//           //curve
//           CustomPaint(
//             size: Size(SizeConfig.screenWidth, SizeConfig.screenHeight),
//             painter: curve,
//           ),
//
//
//           SafeArea(
//             child: Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//
//                     //steps
//                     Padding(
//                       padding: const EdgeInsets.only(top: 150),
//                       child: Text(
//                         "Step 4 of 5",
//                         style: TextStyle(
//                             fontFamily: pop,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.primaryColor,
//                             fontSize: SizeConfig.fixedTextSize(25)),
//                       ),
//                     ),
//
//                     //question
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 35),
//                       child: Text(textAlign: TextAlign.center,
//                         ' "What was your most recent HbA1c level?"',
//                         style: TextStyle(
//                             fontFamily: pop,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.defaultfont,
//                             fontSize: SizeConfig.fixedTextSize(30)),
//                       ),
//                     ),
//
//                     Container(
//                       width: double.infinity,
//                       height: SizeConfig.fixedTextSize(500),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(color: AppColors.primaryColor),
//                           borderRadius: BorderRadius.only(topRight: Radius.circular(60),topLeft: Radius.circular(60),)),
//
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 50),
//                             child: TextField(
//                               controller: hbA1cController,
//                               keyboardType: TextInputType.numberWithOptions(decimal: true),
//                               decoration: InputDecoration(
//                                 hintText: "HbA1c level",
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 labelText: "Enter value (in %)",
//                                 border: OutlineInputBorder(),
//                                 suffixText: "%",
//                                 suffixStyle: TextStyle(color: Colors.black)
//                               ),
//                             ),
//                           ),
//                           // ElevatedButton(
//                           //   onPressed: () {
//                           //     final value = hbA1cController.text;
//                           //     if (value.isNotEmpty) {
//                           //       print("User HbA1c input: $value%");
//                           //     } else {
//                           //       print("No input provided");
//                           //     }
//                           //   },
//                           //   child: Text("Submit"),
//                           // ),
//
//                           Padding(
//                             padding: const EdgeInsets.all(10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 // Previous Button
//                                 Consumer<PageviewVm>(
//                                   builder: (context, vm, child) {
//                                     return InkWell(
//                                       onTap: () {
//                                         vm.previousPage();
//                                       },
//                                       child: Container(
//                                         height: SizeConfig.fixedTextSize(50),
//                                         width: SizeConfig.fixedTextSize(190), // Set width to 190
//                                         decoration: BoxDecoration(
//                                             border: Border.all(color: AppColors.primaryColor),
//                                             borderRadius: BorderRadius.circular(30)),
//                                         child: Center(
//                                             child: Text(
//                                               "Previous",
//                                               style: TextStyle(
//                                                 fontFamily: pop,
//                                               ),
//                                             )),
//                                       ),
//                                     );
//                                   },
//                                 ),
//
//                                 // Next Button
//                                 Consumer<PageviewVm>(
//                                   builder: (context, vm, child) {
//                                     return Container(
//                                       height: SizeConfig.fixedTextSize(50),
//                                       width: SizeConfig.fixedTextSize(190), // Set width to 190
//                                       child: RoundButton(
//                                         title: "Next",
//                                         onPress: () {
//                                           // Check if the TextField has a value entered
//                                           if (hbA1cController.text.isNotEmpty) {
//                                             // Proceed only if a value is entered
//                                             vm.nextPage();
//                                           } else {
//                                             // Show a message if no value is entered
//                                             ScaffoldMessenger.of(context).showSnackBar(
//                                               const SnackBar(
//                                                 content: Text('Please enter your glucose level', style: TextStyle(color: Colors.white)),
//                                                 backgroundColor: Colors.red,
//                                               ),
//                                             );
//                                           }
//                                         },
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
