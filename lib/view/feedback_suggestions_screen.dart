// import 'package:flutter/material.dart';
// import 'package:gluco_track/resources/components/size_config.dart';
//
// import '../utils/constants/app_colors.dart';
// import '../utils/constants/app_fonts.dart';
//
// class FeedbackSuggestionsScreen extends StatefulWidget {
//   @override
//   _FeedbackSuggestionsScreenState createState() =>
//       _FeedbackSuggestionsScreenState();
// }
//
// class _FeedbackSuggestionsScreenState
//     extends State<FeedbackSuggestionsScreen> {
//   final TextEditingController _feedbackController = TextEditingController();
//
//   @override
//   void dispose() {
//     _feedbackController.dispose();
//     super.dispose();
//   }
//
//   void _submitFeedback() {
//     String feedback = _feedbackController.text.trim();
//
//     if (feedback.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please write something before submitting.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }
//
//     // Handle the submission logic here (e.g., save to database, send to server)
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Thank you for your feedback!'),
//         backgroundColor: Colors.green,
//       ),
//     );
//
//     // Clear the text field after submission
//     _feedbackController.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var pop = AppFonts.poppins;
//     final sc = ScreenConfig(context);
//
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       body: Padding(
//         padding: EdgeInsets.all(sc.width(16)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 40),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // Back button container
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context); // Default back functionality
//                       },
//                       child: Container(
//                         width: sc.width(40),
//                         height: sc.height(40),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF2980B9), // Back button color
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.arrow_back, // Back icon
//                           color: Colors.white,
//                           size: sc.width(24),
//                         ),
//                       ),
//                     ),
//
//                     // Spacer for dynamic distribution
//                     const Spacer(),
//
//                     // Centered "Details" text
//                     Text(
//                       "Feedback & Suggestions",
//                       style: TextStyle(
//                         color: AppColors.primaryColor,
//                         fontFamily: pop,
//                         fontSize: sc.text(16),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//
//                     // Spacer for dynamic distribution
//                     const Spacer(),
//
//                     // Placeholder for alignment (same width as back button container)
//                     SizedBox(
//                       width: sc.width(40),
//                     ),
//                   ],
//                 ),
//
//             ),
//
//             // Title Section
//             Text(
//               "We value your feedback!",
//               style: TextStyle(
//                 fontSize: sc.text(16),
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: sc.height(10)),
//             Text(
//               "Your suggestions and feedback help us improve GlucoTrack. Please share your thoughts below.",
//               style: TextStyle(
//                 fontSize: sc.text(14),
//                 color: Colors.black54,
//               ),
//             ),
//             SizedBox(height: sc.height(20)),
//
//             // Feedback Input Field
//             TextField(
//               controller: _feedbackController,
//               maxLines: 6,
//               decoration: InputDecoration(
//                 hintText: "Write your feedback or suggestions here...",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(sc.width(8)),
//                 ),
//               ),
//               style: TextStyle(fontSize: sc.text(14)),
//             ),
//             SizedBox(height: sc.height(20)),
//
//             // Submit Button
//             ElevatedButton(
//               onPressed: _submitFeedback,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF2980B9), // Button color
//                 padding: EdgeInsets.symmetric(
//                   vertical: sc.height(12),
//                   horizontal: sc.width(16),
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(sc.width(8)),
//                 ),
//               ),
//               child: Text(
//                 "Submit Feedback",
//                 style: TextStyle(
//                   fontSize: sc.text(14),
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//
//             SizedBox(height: sc.height(30)),
//
//             // Footer Message
//             Center(
//               child: Text(
//                 "We appreciate your time and effort to help us improve!",
//                 style: TextStyle(
//                   fontSize: sc.text(12),
//                   color: Colors.black38,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
