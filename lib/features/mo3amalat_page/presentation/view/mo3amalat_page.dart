import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/helpers/transaction_model.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/mo3amalat_page/cubits/search/search_cubit.dart';
import 'package:masaref/features/mo3amalat_page/cubits/search/search_states.dart';
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
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    textDirection: TextDirection.ltr,
                    color: AppColors.colorWhite,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                SearchField(
                  categorynamesList: categorynamesList,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.r),
                    child: BlocBuilder<SearchCubit, SearchStates>(
                      builder: (_, state) => ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: state is SearchSearchedState
                            ? state.searchedList.length
                            : categorynamesList.length,
                        itemBuilder: (context, index) {
                          return Mo3amalaComponant(
                              transactionModel: state is SearchSearchedState
                                  ? transactionList[categorynamesList
                                      .indexOf(state.searchedList[index])]
                                  : transactionList[index],
                              cateName: state is SearchSearchedState
                                  ? categorynamesList[categorynamesList
                                      .indexOf(state.searchedList[index])]
                                  : categorynamesList[index],
                              transactionlist: transactionList);
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10.h),
                      ),
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
