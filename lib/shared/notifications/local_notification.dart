//
//
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationApi {
//   static int counter = 0;
//   static final notifications = FlutterLocalNotificationsPlugin();
//
//
//   static Future<void> showNotification(
//       { String? state, String?title, String? body,}) async {
//     await notifications.show(counter, title, body, notificationsDetails() );
//     counter++;
//   }
//
//   static NotificationDetails notificationsDetails() {
//     return const NotificationDetails(
//       android: AndroidNotificationDetails(
//           'channel id',
//           'channel name',
//           'channel description',
//           importance: Importance.max
//
//       ),
//       iOS: IOSNotificationDetails(
//
//       ),
//     );
//   }
//
//   static Future init() async {
//     final android = AndroidInitializationSettings('@mipmap/kaysh');
//     final Ios = IOSInitializationSettings();
//     final settings = InitializationSettings(android: android, iOS: Ios);
//     await notifications.initialize(
//         settings,
//         onSelectNotification: (String? payload)async {
//           print(payload);
//           return payload;
//         }
//     );
//   }
// }