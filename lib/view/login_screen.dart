// import 'package:flutter/material.dart';
// import 'package:gluco_track/utils/constants/app_colors.dart';
// import 'package:provider/provider.dart';
//
// import '../resources/components/blue_curve_painter.dart';
// import '../resources/components/round_button.dart';
// import '../resources/components/size_config.dart';
// import '../utils/Routes/routes_names.dart';
// import '../utils/constants/app_fonts.dart';
// import '../utils/constants/assets.dart';
// import '../utils/utils.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   //for obscure toggle button
//   ValueNotifier<bool> _obscureText = ValueNotifier<bool>(false);
//
//   FocusNode emailFocus = FocusNode();
//   FocusNode passwordFocus = FocusNode();
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   void dispose() {
//     _obscureText.dispose();
//
//     emailFocus.dispose();
//     passwordFocus.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }
//
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
//           // Curve
//           CustomPaint(
//             size: Size(SizeConfig.screenWidth, SizeConfig.screenHeight),
//             painter: curve,
//           ),
//           SafeArea(
//             child: Column(
//               children: [
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(height: SizeConfig.fixedSize(100)),
//                         Image.asset(
//                           Assets.logo,
//                           width: SizeConfig.fixedSize(150),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top:200),
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                               fontFamily: AppFonts.poppins,
//                               fontWeight: FontWeight.bold,
//                               fontSize: SizeConfig.fixedTextSize(30),
//                             ),
//                           ),
//                         ),
//                         // Email
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 30.0),
//                           child: TextFormField(
//                             focusNode: emailFocus,
//                             controller: emailController,
//                             onFieldSubmitted: (value) {
//                               Utils.textfieldFocusChange(
//                                   context, emailFocus, passwordFocus);
//                             },
//                             decoration: InputDecoration(
//                               prefixIcon: Icon(Icons.alternate_email_outlined),
//                               prefixIconColor: AppColors.primaryColor,
//                               hintText: "Enter email",
//                               hintStyle: TextStyle(fontFamily: AppFonts.cabin),
//                             ),
//                           ),
//                         ),
//                         // Password
//                         ValueListenableBuilder(
//                           valueListenable: _obscureText,
//                           builder: (context, value, child) {
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 10, horizontal: 30.0),
//                               child: TextFormField(
//                                 focusNode: passwordFocus,
//                                 obscureText: _obscureText.value,
//                                 controller: passwordController,
//                                 decoration: InputDecoration(
//                                   suffixIcon: InkWell(
//                                     onTap: () {
//                                       _obscureText.value = !_obscureText.value;
//                                     },
//                                     child: _obscureText.value
//                                         ? Icon(Icons.visibility_off)
//                                         : Icon(Icons.visibility),
//                                   ),
//                                   suffixIconColor: AppColors.primaryColor,
//                                   prefixIcon: Icon(Icons.lock_rounded),
//                                   prefixIconColor: AppColors.primaryColor,
//                                   hintText: "Password",
//                                   hintStyle: TextStyle(fontFamily: AppFonts.cabin),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//
//                         // New to this platform
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 20),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.pushNamed(context, RoutesNames.signup);
//                             },
//                             child: RichText(
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: "New to this platform? ",
//                                     style: TextStyle(
//                                       color: AppColors.defaultfont,
//                                       fontFamily: AppFonts.poppins,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: "Signup",
//                                     style: TextStyle(
//                                       fontFamily: AppFonts.poppins,
//                                       color: AppColors.primaryColor,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//
//                 // Login button
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 20),
//                   child: RoundButton(
//                     title: 'Login',
//                     onPress: () {
//                       if (emailController.text.isEmpty) {
//                         Utils.flushBarErrorMessage("Email Missing", context);
//                       } else if (passwordController.text.isEmpty) {
//                         Utils.flushBarErrorMessage("Password is missing", context);
//                       } else if (passwordController.text.length < 6) {
//                         Utils.flushBarErrorMessage(
//                             "Please enter a 6-digit password", context);
//                       } else {
//                         Navigator.pushNamed(context, RoutesNames.home);
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//
//
//   }
// }
