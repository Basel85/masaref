import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/data/repositories/wallet_repository.dart';
import 'package:masaref/features/update_wallet/cubits/delete_wallet/delete_wallet_states.dart';

class DeleteWalletCubit extends Cubit<DeleteWalletStates> {
  DeleteWalletCubit() : super(DeleteWalletInitialState());
  static DeleteWalletCubit get(context) => BlocProvider.of(context);
  void deleteWallet({required int id}) {
    try {
      WalletRepository.deleteWallet(id: id);
      emit(DeleteWalletSuccessState());
    } catch (e) {
      emit(DeleteWalletErrorState(errorMessage: "Something went wrong"));
    }
  }
}
