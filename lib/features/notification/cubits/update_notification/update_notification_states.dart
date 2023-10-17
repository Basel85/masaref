abstract class UpdateNotificationStates {}
class UpdateNotificationInitialState extends UpdateNotificationStates {}
class UpdateNotificationSuccessState extends UpdateNotificationStates {}
class UpdateNotificationErrorState extends UpdateNotificationStates {
  final String errorMessage;
  UpdateNotificationErrorState({required this.errorMessage});
}