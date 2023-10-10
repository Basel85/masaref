import 'package:masaref/features/add_new_wallet/data/models/wallet_model.dart';

abstract class GetAllWalletsStates {}
class GetAllWalletsInitialState extends GetAllWalletsStates {}
class GetAllWalletsSuccessState extends GetAllWalletsStates {
  final List<WalletModel> wallets;

  GetAllWalletsSuccessState({required this.wallets});
}
class GetAllWalletsErrorState extends GetAllWalletsStates {
  final String errorMessage;
  GetAllWalletsErrorState({required this.errorMessage});
}