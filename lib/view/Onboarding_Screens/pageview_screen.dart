// import 'package:flutter/material.dart';
// import 'package:gluco_track/resources/components/round_button.dart';
// import 'package:gluco_track/view/Onboarding_Screens/onboarding_1.dart';
// import 'package:gluco_track/view/Onboarding_Screens/onboarding_2.dart';
// import 'package:gluco_track/view/Onboarding_Screens/onboarding_4.dart';
// import 'package:gluco_track/view/Onboarding_Screens/onboarding_5.dart';
// import 'package:provider/provider.dart';
//
// import '../../resources/components/blue_curve_painter.dart';
// import '../../resources/components/size_config.dart';
// import '../../utils/constants/app_colors.dart';
// import '../../utils/constants/app_fonts.dart';
// import '../../view_model/pageview_vm.dart';
// import 'onboarding_3.dart';
//
// class PageViewScreen extends StatefulWidget {
//   @override
//   _PageViewScreenState createState() => _PageViewScreenState();
// }
//
// class _PageViewScreenState extends State<PageViewScreen> {
//   // PageController _pageController = PageController();
//   // int _currentPage = 0;
//
//   @override
//   void dispose() {
//    // _pageController.dispose();
//     super.dispose();
//   }
//
//   // void _nextPage() {
//   //   if (_currentPage < 7) {
//   //     setState(() {
//   //       _currentPage++;
//   //       _pageController.nextPage(
//   //         duration: Duration(milliseconds: 300),
//   //         curve: Curves.easeInOut,
//   //       );
//   //     });
//   //   }
//   // }
//   //
//   // void _previousPage() {
//   //   if (_currentPage > 0) {
//   //     setState(() {
//   //       _currentPage--;
//   //       _pageController.previousPage(
//   //         duration: Duration(milliseconds: 300),
//   //         curve: Curves.easeInOut,
//   //       );
//   //     });
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);
//     BlueCurvePainter curve = BlueCurvePainter();
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       body: Stack(
//         children: [
//           CustomPaint(
//             size: Size(SizeConfig.screenWidth, SizeConfig.screenHeight),
//             painter: curve,
//           ),
//           Consumer<PageviewVm>(
//             builder: (context, vm, child) {
//               return PageView(
//                 controller: vm.pageController,
//                 physics: NeverScrollableScrollPhysics(), // Prevent swiping
//                 children: [
//                   Onboarding1(),
//                   Onboarding2(),
//                   Onboarding3(),
//                   Onboarding4(),
//                   Onboarding5(),
//
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//
//     );
//   }
//
//   // Widget _buildScreen2() {
//   //   return Padding(
//   //     padding: const EdgeInsets.all(16.0),
//   //     child: Column(
//   //       mainAxisAlignment: MainAxisAlignment.center,
//   //       children: [
//   //         TextField(
//   //           decoration: InputDecoration(labelText: "What is your age?"),
//   //           keyboardType: TextInputType.number,
//   //         ),
//   //         TextField(
//   //           decoration: InputDecoration(labelText: "What is your weight?"),
//   //           keyboardType: TextInputType.number,
//   //         ),
//   //         DropdownButtonFormField(
//   //           items: [
//   //             DropdownMenuItem(child: Text("Type 1"), value: "Type 1"),
//   //             DropdownMenuItem(child: Text("Type 2"), value: "Type 2"),
//   //             DropdownMenuItem(
//   //                 child: Text("I’m not sure"), value: "I’m not sure"),
//   //           ],
//   //           onChanged: (value) {},
//   //           decoration: InputDecoration(labelText: "Do you have diabetes?"),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//
// }
