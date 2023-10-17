import 'package:masaref/core/helpers/db_helper.dart';
import 'package:masaref/core/helpers/notification_helper.dart';
import 'package:masaref/features/notification/data/models/notification_model.dart';

class NotificationRepository {
  static List<Map<String, dynamic>> _notifications = [];
  static void updateNotification(
      {required int id,
      required DateTime currentDate,
      required int isSwitchedOn}) {
    print("Hello");
    DBHelper.updateRecordonNotification(
        id: id,
        time:
            "${currentDate.hour < 9 ? "0${currentDate.hour}" : "${currentDate.hour}"}:${currentDate.minute < 9 ? "0${currentDate.minute}" : "${currentDate.minute}"} ${currentDate.hour >= 12 ? "PM" : "AM"}",
        isSwitchedOn: isSwitchedOn);
    print(currentDate);
    if (isSwitchedOn == 1) {
      NotificationHelper.cancelNotification(id: id);
      NotificationHelper.addScheduledNotification(
          id: id, currentDate: currentDate);
    } else {
      NotificationHelper.cancelNotification(id: id);
    }
  }

  static Future<List<NotificationModel>> getAllNotifications() async {
    _notifications =
        await DBHelper.getAll("Notification") as List<Map<String, dynamic>>;
    return _notifications
        .map((notification) => NotificationModel.fromMap(notification))
        .toList()
        .cast<NotificationModel>();
  }
}

  // static void removeNotification({required int id}) {
  //   NotificationHelper.cancelNotification(id: id);
  // }

