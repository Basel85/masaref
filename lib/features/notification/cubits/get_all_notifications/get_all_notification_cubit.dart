import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/features/notification/cubits/get_all_notifications/get_all_notification_states.dart';
import 'package:masaref/features/notification/data/repositories/notification_repository.dart';

class GetAllNotificationCubit extends Cubit<GetAllNotificationStates> {
  GetAllNotificationCubit() : super(GetAllNotificationInitialState());

  static GetAllNotificationCubit get(context) => BlocProvider.of(context);
  void getAllNotifications() async{
    try {
      emit(GetAllNotificationLoadingState());
      final notifications = await NotificationRepository.getAllNotifications();
      emit(GetAllNotificationSuccessState(notifications: notifications));
    } catch (_) {
      emit(GetAllNotificationErrorState(errorMessage: "Something went wrong"));
    }
  }
}
