import 'package:masaref/features/notification/data/models/notification_model.dart';

abstract class GetAllNotificationStates {}

class GetAllNotificationInitialState extends GetAllNotificationStates {}

class GetAllNotificationLoadingState extends GetAllNotificationStates {}

class GetAllNotificationSuccessState extends GetAllNotificationStates {
  final List<NotificationModel> notifications;

  GetAllNotificationSuccessState({required this.notifications});
}

class GetAllNotificationErrorState extends GetAllNotificationStates {
  final String errorMessage;
  GetAllNotificationErrorState({required this.errorMessage});
}
