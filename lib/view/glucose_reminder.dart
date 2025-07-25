// import 'package:flutter/material.dart';
// import 'package:gluco_track/utils/local_notifications.dart';
//
// class GLucoseReminder extends StatefulWidget {
//   @override
//   _GLucoseReminderState createState() => _GLucoseReminderState();
// }
//
// class _GLucoseReminderState extends State<GLucoseReminder> {
//   TimeOfDay? _selectedTime;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadSavedNotificationTime();
//   }
//
//   // Load the saved notification time (if any)
//   void _loadSavedNotificationTime() {
//     // You can store the time using SharedPreferences or any other method
//     // For now, setting it to a default time
//     _selectedTime = TimeOfDay(hour: 12, minute: 0);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Notification Settings')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ListTile(
//               title: Text('Notification Time'),
//               subtitle: Text(
//                 _selectedTime != null
//                     ? '${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}'
//                     : '12:00 PM',
//               ),
//               trailing: Icon(Icons.edit),
//               onTap: () async {
//                 // Show the time picker to allow the user to choose the time
//                 final time = await showTimePicker(
//                   context: context,
//                   initialTime: _selectedTime ?? TimeOfDay(hour: 12 , minute: 0),
//                 );
//                 if (time != null) {
//                   setState(() {
//                     _selectedTime = time;
//                   });
//
//                   // Convert the selected TimeOfDay to Flutter's time format
//                   final flutterTime = TimeOfDay(hour: time.hour, minute: time.minute);
//
//                   // Cancel any previously set notification
//                   await LocalNotifications.cancelNotification(0);
//
//                   // Schedule the new daily notification
//                   await LocalNotifications.scheduleDailyNotification(
//                     0,
//                     'Daily Glucose Reminder',
//                     'Hi! Don\'t forget to enter your glucose level today 😊',
//                     flutterTime,
//                   );
//
//                   // Show a confirmation snack bar
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Notification updated to ${time.format(context)}')),
//                   );
//                   print('Selected Time: ${time.hour}:${time.minute}');
//
//                 }
//
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
