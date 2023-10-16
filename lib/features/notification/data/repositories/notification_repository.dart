import 'package:masaref/core/helpers/notification_helper.dart';

class NotificationRepository {
  static void addNotification({required int id,required DateTime currentDate}) {
    NotificationHelper.addScheduledNotification(id: id,currentDate: currentDate);
  }
  static void removeNotification({required int id}) {
    NotificationHelper.cancelNotification(id: id);
  } 
}
