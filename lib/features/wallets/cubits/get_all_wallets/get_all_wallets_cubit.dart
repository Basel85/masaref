import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/data/repositories/wallet_repository.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_states.dart';

class GetAllWalletsCubit extends Cubit<GetAllWalletsStates> {
  GetAllWalletsCubit() : super(GetAllWalletsInitialState());
  double _totalBalance = 0;
  double get totalBalance => _totalBalance;
  static GetAllWalletsCubit get(context) => BlocProvider.of(context);
  void getAllWallets() async {
    _totalBalance = 0;
    try {
      final wallets = await WalletRepository.getAllWallets();
      for (int index = 0; index < wallets.length; index++) {
        _totalBalance += wallets[index].balance;
      }
      emit(GetAllWalletsSuccessState(wallets: wallets,totalBalance: _totalBalance));
    } catch (e) {
      emit(GetAllWalletsErrorState(errorMessage: e.toString()));
    }
  }
}
