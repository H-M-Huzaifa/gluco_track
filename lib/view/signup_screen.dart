// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../resources/components/blue_curve_painter.dart';
// import '../resources/components/round_button.dart';
// import '../resources/components/size_config.dart';
// import '../utils/Routes/routes_names.dart';
// import '../utils/constants/app_colors.dart';
// import '../utils/constants/app_fonts.dart';
// import '../utils/constants/assets.dart';
// import '../utils/utils.dart';
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});
//
//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   //for obscure toggle button
//   ValueNotifier<bool> _obscureText = ValueNotifier<bool>(false);
//
//   FocusNode nameFocus = FocusNode();
//   FocusNode emailFocus = FocusNode();
//   FocusNode phoneFocus = FocusNode();
//   FocusNode addressFocus = FocusNode();
//   FocusNode passwordFocus = FocusNode();
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   void dispose() {
//     _obscureText.dispose();
//
//     nameFocus.dispose();
//     emailFocus.dispose();
//     phoneFocus.dispose();
//     addressFocus.dispose();
//     passwordFocus.dispose();
//     nameController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     addressController.dispose();
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
//
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       body: Stack(children: [
//         //Curve
//         CustomPaint(
//           size: Size(SizeConfig.screenWidth, SizeConfig.screenHeight),
//           painter: curve,
//         ),
//
//         Positioned(
//             top: SizeConfig.scaleHeight(50),
//             left: SizeConfig.scaleWidth(20),
//             child: InkWell(
//               onTap: (){
//                 Navigator.pop(context);
//               },
//               child: Icon(
//                 Icons.arrow_back,
//                 color: Colors.white,
//               ),
//             )),
//
//         SafeArea(
//           child: Column(
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 100),
//                         child: Text(
//                           "Signup",
//                           style: TextStyle(
//                               fontFamily: pop,
//                               fontWeight: FontWeight.bold,
//                               fontSize: SizeConfig.scaleText(30)),
//                         ),
//                       ),
//                       Column(
//                         children: [
//                             CircleAvatar(
//                               backgroundImage: AssetImage(Assets.avatar),
//                               maxRadius: 70,
//                             ),
//                         ],
//                       ),
//
//                       //Name
//                       Padding(
//                         padding:
//                         const EdgeInsets.symmetric(vertical: 10, horizontal: 30.0),
//                         child: TextFormField(
//                           focusNode: nameFocus,
//                           controller: nameController,
//                           onFieldSubmitted: (value) {
//                             Utils.textfieldFocusChange(
//                                 context, nameFocus, emailFocus);
//                           },
//                           keyboardType: TextInputType.name,
//
//                           decoration: InputDecoration(
//                               prefixIcon: Icon(Icons.drive_file_rename_outline),
//                               prefixIconColor: AppColors.primaryColor,
//                               hintText: "Name",
//                               hintStyle: TextStyle(fontFamily: AppFonts.cabin)),
//                         ),
//                       ),
//
//                       //Email
//                       Padding(
//                         padding:
//                             const EdgeInsets.symmetric(vertical: 10, horizontal: 30.0),
//                         child: TextFormField(
//                           focusNode: emailFocus,
//                           controller: emailController,
//                           onFieldSubmitted: (value) {
//                             Utils.textfieldFocusChange(
//                                 context, emailFocus, phoneFocus);
//                           },
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                               prefixIcon: Icon(Icons.alternate_email_outlined),
//                               prefixIconColor: AppColors.primaryColor,
//                               hintText: "Email",
//                               hintStyle: TextStyle(fontFamily: AppFonts.cabin)),
//                         ),
//                       ),
//
//                       //Phone
//                       Padding(
//                         padding:
//                         const EdgeInsets.symmetric(vertical: 10, horizontal: 30.0),
//                         child: TextFormField(
//                           focusNode: phoneFocus,
//                           controller: phoneController,
//                           onFieldSubmitted: (value) {
//                             Utils.textfieldFocusChange(
//                                 context, phoneFocus, addressFocus);
//                           },
//                           keyboardType: TextInputType.phone,
//                           decoration: InputDecoration(
//                               prefixIcon: Icon(Icons.phone),
//                               prefixIconColor: AppColors.primaryColor,
//                               hintText: "Phone Number",
//                               hintStyle: TextStyle(fontFamily: AppFonts.cabin)),
//                         ),
//                       ),
//
//                       //Address
//                       Padding(
//                         padding:
//                         const EdgeInsets.symmetric(vertical: 10, horizontal: 30.0),
//                         child: TextFormField(
//                           focusNode: addressFocus,
//                           controller: addressController,
//                           onFieldSubmitted: (value) {
//                             Utils.textfieldFocusChange(
//                                 context, addressFocus, passwordFocus);
//                           },
//                           keyboardType: TextInputType.streetAddress,
//
//                           decoration: InputDecoration(
//                               prefixIcon: Icon(Icons.location_on_rounded),
//                               prefixIconColor: AppColors.primaryColor,
//                               hintText: "Address",
//                               hintStyle: TextStyle(fontFamily: AppFonts.cabin)),
//                         ),
//                       ),
//
//                       //Password
//                       ValueListenableBuilder(
//                         valueListenable: _obscureText,
//                         builder: (context, value, child) {
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 10, horizontal: 30.0),
//                             child: TextFormField(
//                               focusNode: passwordFocus,
//                               obscureText: _obscureText.value,
//                               controller: passwordController,
//                               onFieldSubmitted: (value) {},
//                               keyboardType: TextInputType.visiblePassword,
//
//                               decoration: InputDecoration(
//                                   suffixIcon: InkWell(
//                                       onTap: () {
//                                         _obscureText.value = !_obscureText.value;
//                                       },
//                                       child: _obscureText.value
//                                           ? Icon(Icons.visibility_off)
//                                           : Icon(Icons.visibility)),
//                                   suffixIconColor: AppColors.primaryColor,
//                                   prefixIcon: Icon(Icons.lock_rounded),
//                                   prefixIconColor: AppColors.primaryColor,
//                                   hintText: "Password",
//                                   hintStyle: TextStyle(fontFamily: AppFonts.cabin)),
//                             ),
//                           );
//                         },
//                       ),
//
//                       //New to this platform
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 20),
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(context, RoutesNames.signup);
//                           },
//                           child: RichText(
//                               text: TextSpan(children: [
//                             TextSpan(
//                                 text: "Already have an account? ",
//                                 style: TextStyle(
//                                   color: AppColors.defaultfont,
//                                   fontFamily: pop,
//                                 )),
//                             TextSpan(
//                                 text: "Login",
//                                 style: TextStyle(
//                                     fontFamily: pop,
//                                     color: AppColors.primaryColor,
//                                     fontWeight: FontWeight.bold))
//                           ])),
//                         ),
//                       ),
//
//
//                     ],
//                   ),
//                 ),
//               ),
//               //signup button
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20),
//                 child: RoundButton(
//                   title: 'Signup',
//                   onPress: () {
//                     Navigator.pushNamed(context, RoutesNames.pageview);
//
//
//                     // if (emailController.text.isEmpty) {
//                     //   return Utils.flushBarErrorMessage(
//                     //       "Email Missing", context);
//                     // } else if (passwordController.text.isEmpty) {
//                     //   return Utils.flushBarErrorMessage(
//                     //       "Password is missing", context);
//                     // } else if (passwordController.text.length < 6) {
//                     //   return Utils.flushBarErrorMessage(
//                     //       "Please enter 6 digit password", context);
//                     // } else {
//                     //   Navigator.pushNamed(context, RoutesNames.home);
//                     // }
//                   },
//                 ),
//               ),
//             ],
//           ),
//
//         ),
//       ]),
//     );
//   }
// }
