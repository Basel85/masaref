
abstract class AddNewWalletStates {}

class AddNewWalletInitialState extends AddNewWalletStates {}

class AddNewWalletSuccessState extends AddNewWalletStates {}

class AddNewWalletErrorState extends AddNewWalletStates {
  final String errorMessage;

  AddNewWalletErrorState({required this.errorMessage});
}
