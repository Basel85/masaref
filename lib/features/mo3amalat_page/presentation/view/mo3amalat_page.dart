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

class Mo3amalatPage extends StatefulWidget {
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
  State<Mo3amalatPage> createState() => _Mo3amalatPageState();
}

class _Mo3amalatPageState extends State<Mo3amalatPage> {
  List<int> catyids = [];
  List<String> catyimages = [];
  List<Map> value = [];

  void getImages() async {
    catyids.clear();
    catyimages.clear();
    for (var element in widget.transactionList) {
      catyids.add(element.categoryID!);
    }
    catyimages = await BlocProvider.of<WholeAppCubit>(context)
        .getCategoryimages(catyids);
  }

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<WholeAppCubit>(context)
                        .changePriorityIndex(null);
                    await BlocProvider.of<WholeAppCubit>(context)
                        .getPriorityTransactions();
        return true;
      },
      child: BlocBuilder<WholeAppCubit, WholeAppStates>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: !widget.isPriorities
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
                        value: BlocProvider.of<WholeAppCubit>(context)
                            .priorityIndex,
                        items: const [
                          DropdownMenuItem(
                            value: null,
                            alignment: Alignment.centerRight,
                            child: Text('الكل'),
                          ),
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
                      BlocProvider.of<WholeAppCubit>(context)
                          .changePriorityIndex(null);
                      BlocProvider.of<WholeAppCubit>(context)
                          .getPriorityTransactions();
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
              // widget.transactionList.isEmpty
              //     ? const Center(
              //         child: CircularProgressIndicator.adaptive(),
              //       )
              //     :
              body: Column(
                children: [
                  if (!widget.isPriorities)
                    SearchField(
                      categorynamesList: widget.categorynamesList,
                    ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.r),
                      child: BlocBuilder<SearchCubit, SearchStates>(
                        builder: (_, state) => ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: widget.transactionList.isEmpty
                              ? 1
                              : state is SearchSearchedState
                                  ? state.searchedList.length
                                  : widget.categorynamesList.length,
                          itemBuilder: (context, index) {
                            if (widget.transactionList.isEmpty) {
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
                                    ? widget.transactionList[widget
                                        .categorynamesList
                                        .indexOf(state.searchedList[index])]
                                    : widget.transactionList[index],
                                cateName: state is SearchSearchedState
                                    ? widget.categorynamesList[widget
                                        .categorynamesList
                                        .indexOf(state.searchedList[index])]
                                    : widget.categorynamesList[index],
                                transactionlist: widget.transactionList,
                                isPriorities: widget.isPriorities,
                                cateImage: state is SearchSearchedState
                                    ? catyimages[widget.categorynamesList
                                        .indexOf(state.searchedList[index])]
                                    : catyimages[index],
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
      ),
    );
  }
}
