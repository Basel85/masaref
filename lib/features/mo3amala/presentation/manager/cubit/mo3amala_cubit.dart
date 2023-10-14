import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/features/add_new_wallet/data/models/wallet_model.dart';
import 'package:masaref/features/categories/data/category_model.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_state.dart';

class Mo3amalaCubit extends Cubit<Mo3amalaState> {
  Mo3amalaCubit() : super(Mo3amalaInitial());

  String? notes;
  double? price;
  WalletModel? pickedWallet;
  CategoryModel? pickedCategory;
  bool repeatChange = false;
  int importanceIndex = 0;
  DateTime transDate = DateTime.now();
  TimeOfDay transTime = TimeOfDay.now();

  setPrice(double? pric) {
    price = pric;
    emit(Mo3amalaPrice());
  }

  setNotes(String? note) {
    notes = note;
    emit(Mo3amalaNotes());
  }

  changeWallet(WalletModel? wallet) {
    pickedWallet = wallet;
    emit(Mo3amalaChangeWallet());
  }

  changeCategory(CategoryModel? category) {
    pickedCategory = category;
    emit(Mo3amalaChangeCategory());
  }

  chooseDate(DateTime? date) {
    transDate = date ?? transDate;
    emit(Mo3amalaRepeatSwitch());
  }

  chooseTime(TimeOfDay? time) {
    transTime = time ?? transTime;
    emit(Mo3amalaRepeatSwitch());
  }

  switCh() {
    repeatChange = !repeatChange;
    emit(Mo3amalaRepeatSwitch());
  }

  changeSwitch(bool change) {
    repeatChange = change;
    emit(Mo3amalaRepeatSwitch());
  }

  importance(int index) {
    importanceIndex = index;
    emit(Mo3amalaImportance());
  }
}
