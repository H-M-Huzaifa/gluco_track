// import 'dart:async';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
//
// class LocalNotifications {
//   static final _notification = FlutterLocalNotificationsPlugin();
//
//   // Stream controller for handling payload
//   static final onNotification = StreamController<String?>.broadcast();
//
//   // Initialize the notification plugin
//   static Future<void> init() async {
//     final android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     final settings = InitializationSettings(android: android);
//
//     await _notification.initialize(
//       settings,
//       onDidReceiveNotificationResponse: (response) async {
//         onNotification.add(response.payload);
//       },
//     );
//
//     // Initialize time zones if needed
//     tz.initializeTimeZones();
//   }
//
//   // Show a notification immediately when the app is started
//   static Future<void> showNotification(int id, String title, String body) async {
//     await _notification.show(
//       id,
//       title,
//       body,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'immediate_reminder_channel',
//           'Immediate Reminder',
//           channelDescription: 'This reminder is shown when the app starts',
//           importance: Importance.high,
//           priority: Priority.high,
//           playSound: true,
//         ),
//       ),
//     );
//   }
//
//   // Cancel a notification
//   static Future<void> cancelNotification(int id) async {
//     await _notification.cancel(id);
//   }
//
//   // Dispose the notification stream
//   static void dispose() {
//     onNotification.close();
//   }
// }
