import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/utils/enums.dart';
import 'package:masaref/features/add_new_category/cubits/get_main_type_of_transaction/get_main_type_of_transaction_states.dart';

class GetMainTypeOfTransactionCubit extends Cubit<GetMainTypeOfTransactionStates> {
  final Map<Enum, String> _types = {
    MainTypesOfTransactions.expense: "المصروف",
    MainTypesOfTransactions.income: "الدخل",
    MainTypesOfTransactions.debt: "الديون"
  };
  Map<Enum, String> get types => _types;
  GetMainTypeOfTransactionCubit() : super(GetMainTypeOfTransactionInitialState());
  static GetMainTypeOfTransactionCubit get(context) => BlocProvider.of(context);
  void getTheMainTypeOfTransaction(Enum type) {
     emit(GetMainTypeOfTransactionGetState(key: type));
  }
}
