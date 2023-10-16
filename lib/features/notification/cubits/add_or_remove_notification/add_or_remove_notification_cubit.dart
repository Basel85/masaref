import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/features/notification/cubits/add_or_remove_notification/add_or_remove_notification_states.dart';
import 'package:masaref/features/notification/data/repositories/notification_repository.dart';

class AddOrRemoveNotificationCubit
    extends Cubit<AddOrRemoveNotificationStates> {
  AddOrRemoveNotificationCubit() : super(AddOrRemoveNotificationInitialState());

  static AddOrRemoveNotificationCubit get(context) => BlocProvider.of(context);

  bool isNotificationAdded = false;

  void addOrRemoveNotification({required bool isSwitchedOn, required int id,required DateTime currentDateTime}) {
    try {
      if (isSwitchedOn) {
        NotificationRepository.addNotification(id: id);
      } else {
        NotificationRepository.removeNotification(id: id);
      }
      emit(AddOrRemoveNotificationSuccessState());
    } catch (_) {
      emit(AddOrRemoveNotificationErrorState(
          errorMessage: "Something went wrong"));
    }
  }
}
