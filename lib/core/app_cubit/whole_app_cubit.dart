import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/helpers/db_helper.dart';
import 'package:masaref/core/helpers/transaction_model.dart';

class WholeAppCubit extends Cubit<WholeAppStates> {
  WholeAppCubit() : super(WholeAppInitial());

  bool isdark = false;
  String? cateName;
  List<List<String>> cateNames = [];
  List<String> cateNames1 = [];
  List<String> cateNames2 = [];
  List<String> cateNames3 = [];
  List<String> cateNames4 = [];
  List<String> cateNames5 = [];
  List<String> cateNames6 = [];
  List<String> cateNames7 = [];
  double byDayTotal1 = 0;
  double byDayTotal2 = 0;
  double byDayTotal3 = 0;
  double byDayTotal4 = 0;
  double byDayTotal5 = 0;
  double byDayTotal6 = 0;
  double byDayTotal7 = 0;
  List<TransactionModel> repeatedTransactionlist = [];
  List<TransactionModel> transactionlist = [];
  List<TransactionModel> transactionDate1list = [];
  List<TransactionModel> transactionDate2list = [];
  List<TransactionModel> transactionDate3list = [];
  List<TransactionModel> transactionDate4list = [];
  List<TransactionModel> transactionDate5list = [];
  List<TransactionModel> transactionDate6list = [];
  List<TransactionModel> transactionDate7list = [];

  changeAppTheme() {
    isdark = !isdark;
    emit(WholeAppModeChange());
  }

  Future<List<String>> getCategoryName(catyids) async {
    List<String> values = [];
    for (var element in catyids) {
      List<Map> value = await DBHelper.getspecificCategoryName(catyid: element);
      cateName = value[0]['name'];
      values.add(cateName!);
    }
    return values;
  }

  Future getRepeatedTransactions() async {
    List<Map<String, dynamic>> values =
        await DBHelper.getRepeatedTransactions();
    for (var element in values) {
      repeatedTransactionlist.add(TransactionModel.fromDB(element));
    }
    emit(WholeAppRepeatedTransactions());
  }

  Future getTransactionwithDate() async {
    cateNames.clear();
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
    List<int> categoryIDsday1 = [];
    for (var i = 0; i < transactionDate1list.length; i++) {
      categoryIDsday1.add(transactionDate1list[i].categoryID!);
    }
    cateNames.add(await getCategoryName(categoryIDsday1));

    List<Map> day2 = await DBHelper.getTransactionOfSpecificDate(
        date: DateTime.now()
            .subtract(const Duration(days: 1))
            .toString()
            .substring(0, 10));
    for (var element in day2) {
      transactionDate2list.add(TransactionModel.fromDB(element));
    }
    List<int> categoryIDsday2 = [];
    for (var i = 0; i < transactionDate2list.length; i++) {
      categoryIDsday2.add(transactionDate2list[i].categoryID!);
    }
    cateNames.add(await getCategoryName(categoryIDsday2));
    List<Map> day3 = await DBHelper.getTransactionOfSpecificDate(
        date: DateTime.now()
            .subtract(const Duration(days: 2))
            .toString()
            .substring(0, 10));
    for (var element in day3) {
      transactionDate3list.add(TransactionModel.fromDB(element));
    }
    List<int> categoryIDsday3 = [];
    for (var i = 0; i < transactionDate3list.length; i++) {
      categoryIDsday3.add(transactionDate3list[i].categoryID!);
    }
    cateNames.add(await getCategoryName(categoryIDsday3));
    List<Map> day4 = await DBHelper.getTransactionOfSpecificDate(
        date: DateTime.now()
            .subtract(const Duration(days: 3))
            .toString()
            .substring(0, 10));
    for (var element in day4) {
      transactionDate4list.add(TransactionModel.fromDB(element));
    }
    List<int> categoryIDsday4 = [];
    for (var i = 0; i < transactionDate4list.length; i++) {
      categoryIDsday4.add(transactionDate4list[i].categoryID!);
    }
    cateNames.add(await getCategoryName(categoryIDsday4));
    List<Map> day5 = await DBHelper.getTransactionOfSpecificDate(
        date: DateTime.now()
            .subtract(const Duration(days: 4))
            .toString()
            .substring(0, 10));
    for (var element in day5) {
      transactionDate5list.add(TransactionModel.fromDB(element));
    }
    List<int> categoryIDsday5 = [];
    for (var i = 0; i < transactionDate5list.length; i++) {
      categoryIDsday5.add(transactionDate5list[i].categoryID!);
    }
    cateNames.add(await getCategoryName(categoryIDsday5));
    List<Map> day6 = await DBHelper.getTransactionOfSpecificDate(
        date: DateTime.now()
            .subtract(const Duration(days: 5))
            .toString()
            .substring(0, 10));
    for (var element in day6) {
      transactionDate6list.add(TransactionModel.fromDB(element));
    }
    List<int> categoryIDsday6 = [];
    for (var i = 0; i < transactionDate6list.length; i++) {
      categoryIDsday6.add(transactionDate6list[i].categoryID!);
    }
    cateNames.add(await getCategoryName(categoryIDsday6));
    List<Map> day7 = await DBHelper.getTransactionOfSpecificDate(
        date: DateTime.now()
            .subtract(const Duration(days: 6))
            .toString()
            .substring(0, 10));
    for (var element in day7) {
      transactionDate7list.add(TransactionModel.fromDB(element));
    }
    List<int> categoryIDsday7 = [];
    for (var i = 0; i < transactionDate7list.length; i++) {
      categoryIDsday7.add(transactionDate7list[i].categoryID!);
    }
    cateNames.add(await getCategoryName(categoryIDsday7));
    emit(WholeAppAllTransactions());
  }
}
