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
// class Onboarding3 extends StatefulWidget {
//   const Onboarding3({super.key});
//
//   @override
//   State<Onboarding3> createState() => _Onboarding3State();
// }
//
// class _Onboarding3State extends State<Onboarding3> {
//   int? selectedIndex;
//     TextEditingController glucoseController =TextEditingController();
//
//     @override
//   void dispose() {
//       glucoseController.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     var pop=AppFonts.poppins;
//
//     var cabin = AppFonts.cabin;
//     SizeConfig.init(context);
//     BlueCurvePainter curve = BlueCurvePainter();
//
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
//                         "Step 3 of 5",
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
//                         '"What is your average fasting blood glucose level?"',
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
//                       height: SizeConfig.fixedSize(500),
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
//                               controller: glucoseController,
//                               keyboardType: TextInputType.numberWithOptions(decimal: true),
//                               decoration: InputDecoration(
//                                 hintText: "Select a unit",
//                                 hintStyle: const TextStyle(color: Colors.grey),
//                                 labelText: "Enter GLucose Level",
//                                 border: const OutlineInputBorder(),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.blue.shade700, width: 2.0),
//                                 ),
//                                 suffixIcon: PopupMenuButton<String>(
//                                   onSelected: (value) {
//                                     // Handle unit selection
//                                     print("Selected unit: $value");
//                                   },
//                                   itemBuilder: (context) => const [
//                                     PopupMenuItem(
//                                       value: "mg/dL",
//                                       child: Text("mg/dL"),
//                                     ),
//                                     PopupMenuItem(
//                                       value: "mmol/L",
//                                       child: Text("mmol/L"),
//                                     ),
//                                   ],
//                                   icon: const Icon(Icons.arrow_drop_down),
//                                   tooltip: "Select your unit here", // Tooltip for clarity
//                                 ),
//                               ),
//                             ),
//                           ),
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
//                                         height: SizeConfig.fixedSize(50),
//                                         width: SizeConfig.fixedSize(190), // Set width to 190
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
//                                       height: SizeConfig.fixedSize(50),
//                                       width: SizeConfig.fixedSize(190), // Set width to 190
//                                       child: RoundButton(
//                                         title: "Next",
//                                         onPress: () {
//                                           // Check if the TextField has a value entered
//                                           if (glucoseController.text.isNotEmpty) {
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
