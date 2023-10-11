import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/data/repositories/wallet_repository.dart';
import 'package:masaref/features/update_wallet/cubits/update_wallet/update_wallet_states.dart';

class UpdateWalletCubit extends Cubit<UpdateWalletStates> {
  UpdateWalletCubit() : super(UpdateWalletInitialState());
  static UpdateWalletCubit get(context) => BlocProvider.of(context);
  void updateWallet(
      {required String name,
      required double balance,
      required String imagePath,
      required int id}) {
    try {
      WalletRepository.updateWallet(
          id: id,
          name: name,
          balance: balance,
          image: imagePath,
          );
      emit(UpdateWalletSuccessState());
    } catch (e) {
      emit(UpdateWalletErrorState(errorMessage: "Something went wrong"));
    }
  }
}
