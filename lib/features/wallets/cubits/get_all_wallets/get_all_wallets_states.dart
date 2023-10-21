import 'package:masaref/core/data/models/wallet_model.dart';

abstract class GetAllWalletsStates {}

class GetAllWalletsInitialState extends GetAllWalletsStates {}

class GetAllWalletsSuccessState extends GetAllWalletsStates {
  final List<WalletModel> wallets;
  final double totalBalance;

  GetAllWalletsSuccessState({required this.wallets,required this.totalBalance});
}

class GetAllWalletsErrorState extends GetAllWalletsStates {
  final String errorMessage;
  GetAllWalletsErrorState({required this.errorMessage});
}
