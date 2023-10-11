import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/helpers/transaction_model.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/mo3amalat_list_item.dart';

class Mo3amalatListSection extends StatefulWidget {
  const Mo3amalatListSection({
    super.key,
    required this.tranList,
  });
  final List<TransactionModel> tranList;

  @override
  State<Mo3amalatListSection> createState() => _Mo3amalatListSectionState();
}

class _Mo3amalatListSectionState extends State<Mo3amalatListSection> {
  @override
  void initState() {
    super.initState();
    List<int> categoryIDs = [];
    for (var i = 0; i < widget.tranList.length; i++) {
      categoryIDs.add(widget.tranList[i].categoryID!);
    }
      BlocProvider.of<WholeAppCubit>(context)
          .getCategoryName(categoryIDs);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return BlocProvider.of<WholeAppCubit>(context).cateNames.isEmpty ||
                BlocProvider.of<WholeAppCubit>(context).cateNames.length !=
                    widget.tranList.length
            ? const CircularProgressIndicator.adaptive()
            : ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.tranList.length,
                itemBuilder: (context, index) {
                  return Mo3amalatListItem(
                    transactionModel: widget.tranList[index],
                    name: BlocProvider.of<WholeAppCubit>(context)
                        .cateNames[index],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
              );
      },
    );
  }
}
