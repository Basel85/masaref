import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/helpers/db_helper.dart';
import 'package:masaref/core/helpers/transaction_model.dart';

class WholeAppCubit extends Cubit<WholeAppStates> {
  WholeAppCubit() : super(WholeAppInitial());

  bool isdark = false;
  String? cateName;
  List<String> cateNames = [];
  double byDayTotal = 0;
  List<TransactionModel> transactionlist = [];
  List<TransactionModel> transactionDate1list = [];
  List<TransactionModel> transactionDate2list = [];
  List<TransactionModel> transactionDate3list = [];
  List<TransactionModel> transactionDate4list = [];
  List<TransactionModel> transactionDate5list = [];
  List<TransactionModel> transactionDate6list = [];
  List<TransactionModel> transactionDate7list = [];

  getByDayTotal(TransactionModel transactionModel) {
    if (transactionModel.sectionID == 1) {
      byDayTotal = byDayTotal - transactionModel.price!;
    } else {
      byDayTotal = byDayTotal + transactionModel.price!;
    }

    emit(WholeAppGetByDayTotal());
  }

  changeAppTheme() {
    isdark = !isdark;
    emit(WholeAppModeChange());
  }

  getCategoryName(catyids) async {
    for (var element in catyids) {
      await DBHelper.getspecificCategoryName(catyid: element).then((value) {
        cateName = value[0]['name'];
        cateNames.add(cateName!);
      });
    }
    emit(WholeAppGetCategoryName());
  }

  Future getAllTransaction() async {
    transactionlist.clear();
    List<Map> db = await DBHelper.getAll('Trans_action');
    for (var element in db) {
      transactionlist.add(TransactionModel.fromDB(element));
    }
    emit(WholeAppAllTransactions());
  }

  Future getTransactionwithDate() async {
    transactionDate1list.clear();
    transactionDate2list.clear();
    transactionDate3list.clear();
    transactionDate4list.clear();
    transactionDate5list.clear();
    transactionDate6list.clear();
    transactionDate7list.clear();
    List<Map> day1 = await DBHelper.getTransactionOfSpecificDate(
        date: DateTime.now().toString().substring(0, 10));
    for (var element in day1) {
      transactionDate1list.add(TransactionModel.fromDB(element));
    }
    List<Map> day2 = await DBHelper.getTransactionOfSpecificDate(
        date: DateTime.now()
            .subtract(const Duration(days: 1))
            .toString()
            .substring(0, 10));
    for (var element in day2) {
      transactionDate2list.add(TransactionModel.fromDB(element));
    }
    List<Map> day3 = await DBHelper.getTransactionOfSpecificDate(
        date: DateTime.now()
            .subtract(const Duration(days: 2))
            .toString()
            .substring(0, 10));
    for (var element in day3) {
      transactionDate3list.add(TransactionModel.fromDB(element));
    }
    List<Map> day4 = await DBHelper.getTransactionOfSpecificDate(
        date: DateTime.now()
            .subtract(const Duration(days: 3))
            .toString()
            .substring(0, 10));
    for (var element in day4) {
      transactionDate4list.add(TransactionModel.fromDB(element));
    }
    List<Map> day5 = await DBHelper.getTransactionOfSpecificDate(
        date: DateTime.now()
            .subtract(const Duration(days: 4))
            .toString()
            .substring(0, 10));
    for (var element in day5) {
      transactionDate5list.add(TransactionModel.fromDB(element));
    }
    List<Map> day6 = await DBHelper.getTransactionOfSpecificDate(
        date: DateTime.now()
            .subtract(const Duration(days: 5))
            .toString()
            .substring(0, 10));
    for (var element in day6) {
      transactionDate6list.add(TransactionModel.fromDB(element));
    }
    List<Map> day7 = await DBHelper.getTransactionOfSpecificDate(
        date: DateTime.now()
            .subtract(const Duration(days: 6))
            .toString()
            .substring(0, 10));
    for (var element in day7) {
      transactionDate7list.add(TransactionModel.fromDB(element));
    }
  }
}
