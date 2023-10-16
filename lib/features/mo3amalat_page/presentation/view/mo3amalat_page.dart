import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/helpers/transaction_model.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';
import 'package:masaref/features/mo3amalat_page/cubits/search/search_cubit.dart';
import 'package:masaref/features/mo3amalat_page/cubits/search/search_states.dart';
import 'package:masaref/features/mo3amalat_page/presentation/view/widgets/mo3amala_componant.dart';
import 'package:masaref/features/mo3amalat_page/presentation/view/widgets/search_field.dart';

class Mo3amalatPage extends StatelessWidget {
  const Mo3amalatPage({
    super.key,
    required this.transactionList,
    required this.categorynamesList,
    required this.isPriorities,
  });
  final List<TransactionModel> transactionList;
  final List<String> categorynamesList;
  final bool isPriorities;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: !isPriorities
                  ? null
                  : DropdownButton(
                      dropdownColor:
                          BlocProvider.of<WholeAppCubit>(context).isdark
                              ? AppColors.darkMode
                              : AppColors.lightMode,
                      style: AppStyles.textStyle24w400.copyWith(
                        fontSize: 16.sp,
                        color: BlocProvider.of<WholeAppCubit>(context).isdark
                            ? AppColors.colorWhite
                            : AppColors.colorBlack,
                      ),
                      value:
                          BlocProvider.of<WholeAppCubit>(context).priorityIndex,
                      items: const [
                        DropdownMenuItem(
                          alignment: Alignment.centerRight,
                          value: 0,
                          child: Text('اساسى'),
                        ),
                        DropdownMenuItem(
                          value: 1,
                          alignment: Alignment.centerRight,
                          child: Text('عادى'),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          alignment: Alignment.centerRight,
                          child: Text('ترفيهى'),
                        ),
                        DropdownMenuItem(
                          value: null,
                          alignment: Alignment.centerRight,
                          child: Text('الكل'),
                        ),
                      ],
                      onChanged: (value) async {
                        BlocProvider.of<WholeAppCubit>(context)
                            .changePriorityIndex(value);
                        await BlocProvider.of<WholeAppCubit>(context)
                            .getPriorityTransactions();
                      },
                    ),
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
                        itemCount: transactionList.isEmpty
                            ? 1
                            : state is SearchSearchedState
                                ? state.searchedList.length
                                : categorynamesList.length,
                        itemBuilder: (context, index) {
                          if (transactionList.isEmpty) {
                            return Padding(
                              padding: EdgeInsets.only(top: 90.h),
                              child: Center(
                                child: Text(
                                  'لا معاملات للان',
                                  style: AppStyles.textStyle14PrimaryColor,
                                ),
                              ),
                            );
                          } else {
                            return Mo3amalaComponant(
                              transactionModel: state is SearchSearchedState
                                  ? transactionList[categorynamesList
                                      .indexOf(state.searchedList[index])]
                                  : transactionList[index],
                              cateName: state is SearchSearchedState
                                  ? categorynamesList[categorynamesList
                                      .indexOf(state.searchedList[index])]
                                  : categorynamesList[index],
                              transactionlist: transactionList,
                              isPriorities: isPriorities,
                            );
                          }
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
