abstract class GetMainTypeOfTransactionStates {}

class GetMainTypeOfTransactionInitialState
    extends GetMainTypeOfTransactionStates {}

class GetMainTypeOfTransactionGetState extends GetMainTypeOfTransactionStates {
  final Enum key;

  GetMainTypeOfTransactionGetState({required this.key});
}
