import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/data/repositories/wallet_repository.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_states.dart';

class GetAllWalletsCubit extends Cubit<GetAllWalletsStates> {
  GetAllWalletsCubit() : super(GetAllWalletsInitialState());
  static GetAllWalletsCubit get(context) => BlocProvider.of(context);
  void getAllWallets() async{
    try {
      final wallets = await WalletRepository.getAllWallets();
      emit(GetAllWalletsSuccessState(wallets: wallets));
    } catch (e) {
      emit(GetAllWalletsErrorState(errorMessage: e.toString()));
    }
  }

}
