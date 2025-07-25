// import 'package:flutter/material.dart';
// import 'package:gluco_track/resources/components/round_button.dart';
// import 'package:gluco_track/utils/Routes/routes_names.dart';
// import 'package:provider/provider.dart';
//
// import '../../resources/components/blue_curve_painter.dart';
// import '../../resources/components/size_config.dart';
// import '../../utils/constants/app_colors.dart';
// import '../../utils/constants/app_fonts.dart';
// import '../../view_model/pageview_vm.dart';
//
// class Onboarding5 extends StatefulWidget {
//   const Onboarding5({super.key});
//
//   @override
//   State<Onboarding5> createState() => _Onboarding5State();
// }
//
// class _Onboarding5State extends State<Onboarding5> {
//   String? insulinUsage;
//   String? insulinType;
//   final TextEditingController insulinUnitsController = TextEditingController();
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
//           // Curve background
//           CustomPaint(
//             size: Size(SizeConfig.screenWidth, SizeConfig.screenHeight),
//             painter: curve,
//           ),
//
//           SafeArea(
//             child: Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // Steps
//                     Padding(
//                       padding: const EdgeInsets.only(top: 150),
//                       child: Text(
//                         "Step 5 of 5",
//                         style: TextStyle(
//                           fontFamily: pop,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.primaryColor,
//                           fontSize: SizeConfig.fixedTextSize(25),
//                         ),
//                       ),
//                     ),
//
//                     // Question
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 35),
//                       child: Text(
//                         textAlign: TextAlign.center,
//                         '"Are you currently using\ninsulin?"',
//                         style: TextStyle(
//                           fontFamily: pop,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.defaultfont,
//                           fontSize: SizeConfig.fixedTextSize(30),
//                         ),
//                       ),
//                     ),
//
//
//                     // Bottom container
//                     Container(
//                       width: double.infinity,
//                       height: SizeConfig.fixedTextSize(500),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: AppColors.primaryColor),
//                         borderRadius: const BorderRadius.only(
//                           topRight: Radius.circular(60),
//                           topLeft: Radius.circular(60),
//                         ),
//                       ),
//                       child: SingleChildScrollView(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//
//
//                             // Yes/No selection
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: ListTile(
//                                     title: const Text("Yes"),
//                                     leading: Radio<String>(
//                                       value: "Yes",
//                                       groupValue: insulinUsage,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           insulinUsage = value;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: ListTile(
//                                     title: const Text("No"),
//                                     leading: Radio<String>(
//                                       value: "No",
//                                       groupValue: insulinUsage,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           insulinUsage = value;
//                                           insulinType = null;
//                                           insulinUnitsController.clear();
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                             // Conditional content for insulin usage
//                             if (insulinUsage == "Yes")
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                    SizedBox(height: SizeConfig.fixedTextSize(10)),
//                                   Text(
//                                     "What type of insulin do you use?",
//                                     style: TextStyle(
//                                       fontFamily: pop,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: SizeConfig.fixedTextSize(18),
//                                     ),
//                                   ),
//                                    SizedBox(height: SizeConfig.fixedTextSize(10)),
//                                   DropdownButton<String>(
//                                     value: insulinType,
//                                     hint: const Text("Select Insulin Type"),
//                                     items: ["Rapid-acting", "Long-acting", "Both"]
//                                         .map((option) {
//                                       return DropdownMenuItem<String>(
//                                         value: option,
//                                         child: Text(option),
//                                       );
//                                     }).toList(),
//                                     onChanged: (value) {
//                                       setState(() {
//                                         insulinType = value;
//                                       });
//                                     },
//                                   ),
//                                    SizedBox(height: SizeConfig.fixedTextSize(10)),
//                                   Text(
//                                     "How many units of insulin do you typically take daily?",
//                                     style: TextStyle(
//                                       fontFamily: pop,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: SizeConfig.fixedTextSize(18),
//                                     ),
//                                   ),
//                                    SizedBox(height: SizeConfig.fixedTextSize(10)),
//                                   TextField(
//                                     controller: insulinUnitsController,
//                                     keyboardType: TextInputType.number,
//                                     decoration: const InputDecoration(
//                                       labelText: "Enter Insulin units",
//                                       border: OutlineInputBorder(),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                             // // Submit button
//                             // const SizedBox(height: 20),
//                             // ElevatedButton(
//                             //   onPressed: () {
//                             //     if (insulinUsage != null) {
//                             //       if (insulinUsage == "Yes") {
//                             //         if (insulinType == null ||
//                             //             insulinUnitsController.text.isEmpty) {
//                             //           print("Please complete insulin-related details.");
//                             //         } else {
//                             //           print("Insulin Usage: $insulinUsage");
//                             //           print("Insulin Type: $insulinType");
//                             //           print(
//                             //               "Daily Units: ${insulinUnitsController.text}");
//                             //         }
//                             //       } else {
//                             //         print("Insulin Usage: No");
//                             //       }
//                             //     } else {
//                             //       print("No selection made.");
//                             //     }
//                             //   },
//                             //   child: const Text("Submit"),
//                             // ),
//
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   // Previous Button
//                                   Consumer<PageviewVm>(
//                                     builder: (context, vm, child) {
//                                       return InkWell(
//                                         onTap: () {
//                                           vm.previousPage();
//                                         },
//                                         child: Container(
//                                           height: SizeConfig.fixedTextSize(50),
//                                           width: SizeConfig.fixedTextSize(190), // Set width to 190
//                                           decoration: BoxDecoration(
//                                               border: Border.all(color: AppColors.primaryColor),
//                                               borderRadius: BorderRadius.circular(30)),
//                                           child: Center(
//                                               child: Text(
//                                                 "Previous",
//                                                 style: TextStyle(
//                                                   fontFamily: pop,
//                                                 ),
//                                               )),
//                                         ),
//                                       );
//                                     },
//                                   ),
//
//                                   // Next Button
//                                   Consumer<PageviewVm>(
//                                     builder: (context, vm, child) {
//                                       return Container(
//                                         height: SizeConfig.fixedTextSize(50),
//                                         width: SizeConfig.fixedTextSize(190), // Set width to 190
//                                         child: RoundButton(
//                                           title: "Submit",
//                                           onPress: () {
//                                             // Check if the insulinUsage radio button is selected
//                                             if (insulinUsage != null) {
//                                               // If "Yes" is selected, check that insulin type and units are filled
//                                               if (insulinUsage == "Yes") {
//                                                 if (insulinType != null && insulinUnitsController.text.isNotEmpty) {
//                                                   Navigator.pushNamed(context, RoutesNames.bottomnavbar);  // Proceed to the next page if all required fields are filled
//                                                 } else {
//                                                   ScaffoldMessenger.of(context).showSnackBar(
//                                                     const SnackBar(
//                                                       content: Text('Please complete insulin-related details.',
//                                                           style: TextStyle(color: Colors.white)),
//                                                       backgroundColor: Colors.red,
//                                                     ),
//                                                   );
//                                                 }
//                                               } else {
//                                                 // Proceed if "No" is selected, skipping insulin-related fields
//                                                 Navigator.pushNamed(context, RoutesNames.bottomnavbar);
//                                               }
//                                             } else {
//                                               // Show a message if no insulin usage option is selected
//                                               ScaffoldMessenger.of(context).showSnackBar(
//                                                 const SnackBar(
//                                                   content: Text('Please select if you are using insulin.',
//                                                       style: TextStyle(color: Colors.white)),
//                                                   backgroundColor: Colors.red,
//                                                 ),
//                                               );
//                                             }
//                                           },
//                                         ),
//                                       );
//                                     },
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//
//
//
//                           ],
//                         ),
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
