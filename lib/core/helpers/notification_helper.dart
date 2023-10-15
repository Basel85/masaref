import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:masaref/features/mo3amala/presentation/view/mo3amala.dart';
import 'package:masaref/main.dart';
import 'package:timezone/timezone.dart' as timezone;

class NotificationHelper {
  static final _notification = FlutterLocalNotificationsPlugin();
  static const _notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
    "channel id 1",
    "channel name",
    channelDescription: "channel description",
    importance: Importance.max,
    priority: Priority.high,
  ));
  static Future<bool> checkAppNotification() async {
    final details = await _notification.getNotificationAppLaunchDetails();
    return details!.didNotificationLaunchApp;
  }

  static void init() async {
    await _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      ),
      onDidReceiveNotificationResponse: (details) {
        navigatorKey.currentState!.push(
          MaterialPageRoute(
            builder: (_) => const Mo3amalaPage(
              toAdd: true,
              walletList: [],
            ),
          ),
        );
      },
    );
  }

  static void showNotification() async {
    await _notification.show(0, "Gooaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaal",
        "Alahly is the world cup for clubs winner", _notificationDetails);
  }

  static void showScheduledNotification() async {
    _notification.zonedSchedule(
        0,
        "Gooooooooooooooooooooooooooooooooooooooooooooooooooooooaaaaaaaaaaaaaaaal",
        "Alahly is the world cup for clubs winner",
        timezone.TZDateTime.from(
            DateTime.now().add(const Duration(seconds: 30)), timezone.local),
        _notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        androidScheduleMode: AndroidScheduleMode.exact,
        payload: "Basel");
  }
}
