import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as timezone;

class NotificationHelper {
  static final _notification = FlutterLocalNotificationsPlugin();
  static const _notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
    "channel id",
    "channel name",
    channelDescription: "channel description",
    importance: Importance.max,
    priority: Priority.high,
  ));
  
  static void init() async {
    await _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/launcher_icon"),
      ),
      // onDidReceiveNotificationResponse: (details) {
      //   navigatorKey.currentState!.push(
      //     MaterialPageRoute(
      //       builder: (_) => const Mo3amalaPage(
      //         toAdd: true,
      //         walletList: [],
      //       ),
      //     ),
      //   );
      // },
    );
  }

  static void addScheduledNotification(
      {required int id, required DateTime currentDate}) async {
    await _notification.zonedSchedule(
        id,
        "المصاربف",
        "سجل مصاريفك اول بأول",
        timezone.TZDateTime.from(currentDate, timezone.local),
        _notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  static void cancelNotification({required int id}) async {
    await _notification.cancel(id);
  }
}
