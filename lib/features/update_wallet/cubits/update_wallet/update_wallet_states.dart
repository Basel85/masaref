abstract class UpdateWalletStates {}
class UpdateWalletInitialState extends UpdateWalletStates {}
class UpdateWalletSuccessState extends UpdateWalletStates {}
class UpdateWalletErrorState extends UpdateWalletStates {
  final String errorMessage;
  UpdateWalletErrorState({required this.errorMessage});
}

