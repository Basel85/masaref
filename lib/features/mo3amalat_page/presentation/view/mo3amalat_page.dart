import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/helpers/transaction_model.dart';
import 'package:masaref/features/mo3amalat_page/presentation/view/widgets/mo3amala_componant.dart';
import 'package:masaref/features/mo3amalat_page/presentation/view/widgets/search_field.dart';

class Mo3amalatPage extends StatelessWidget {
  const Mo3amalatPage({
    super.key,
    required this.transactionList,
    required this.categorynamesList,
  });
  final List<TransactionModel> transactionList;
  final List<String> categorynamesList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                const SearchField(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.r),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount:
                          transactionList.length == categorynamesList.length
                              ? categorynamesList.length
                              : transactionList.length,
                      itemBuilder: (context, index) {
                        return Mo3amalaComponant(
                            transactionModel: transactionList[index],
                            cateName: categorynamesList[index],
                            transactionlist: transactionList);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.h),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
