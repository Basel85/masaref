abstract class DeleteWalletStates {}
class DeleteWalletInitialState extends DeleteWalletStates {}
class DeleteWalletSuccessState extends DeleteWalletStates {}
class DeleteWalletErrorState extends DeleteWalletStates {
  final String errorMessage;
  DeleteWalletErrorState({required this.errorMessage});
}
