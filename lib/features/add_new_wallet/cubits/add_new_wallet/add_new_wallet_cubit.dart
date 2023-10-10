import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/data/repositories/wallet_repository.dart';
import 'package:masaref/features/add_new_wallet/cubits/add_new_wallet/add_new_wallet_states.dart';

class AddNewWalletCubit extends Cubit<AddNewWalletStates> {
  AddNewWalletCubit() : super(AddNewWalletInitialState());
  static AddNewWalletCubit get(context) => BlocProvider.of(context);
  void addNewWallet(
      {required String name,
      required double balance,
      required File imagePath,
      required int color}) {
    try {
      WalletRepository.addToWallet(
          name: name,
          balance: balance,
          image: "",
          color: color);
      emit(AddNewWalletSuccessState());
    } catch (e) {
      emit(AddNewWalletErrorState(errorMessage: e.toString()));
    }
  }
}
