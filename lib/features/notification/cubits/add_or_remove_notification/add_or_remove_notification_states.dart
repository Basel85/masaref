abstract class AddOrRemoveNotificationStates {}
class AddOrRemoveNotificationInitialState extends AddOrRemoveNotificationStates {}
class AddOrRemoveNotificationSuccessState extends AddOrRemoveNotificationStates {}
class AddOrRemoveNotificationErrorState extends AddOrRemoveNotificationStates {
  final String errorMessage;
  AddOrRemoveNotificationErrorState({required this.errorMessage});
}