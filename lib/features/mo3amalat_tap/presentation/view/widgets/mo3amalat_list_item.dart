import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/helpers/transaction_model.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class Mo3amalatListItem extends StatefulWidget {
  const Mo3amalatListItem({
    super.key,
    required this.transactionModel,
    required this.name,
  });
  final TransactionModel transactionModel;
  final String name;

  @override
  State<Mo3amalatListItem> createState() => _Mo3amalatListItemState();
}

class _Mo3amalatListItemState extends State<Mo3amalatListItem> {
  // @override
  // void initState() {
  //   super.initState();
  //   BlocProvider.of<WholeAppCubit>(context)
  //       .getCategoryName(widget.transactionModel.categoryID);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Row(
          children: [
            CircleAvatar(
              radius: 15.r,
              backgroundColor: AppColors.primaryColor,
            ),
            SizedBox(width: 5.w),
            Text(
              widget.name,
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 12.sp,
                color: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
              ),
            ),
            const Spacer(),
            Text(
              widget.transactionModel.price.toString(),
              style:widget.transactionModel.sectionID==1? AppStyles.textStyle24w400.copyWith(
                color: Colors.red,
                fontSize: 12.sp,
              ):AppStyles.textStyle24w400.copyWith(
                color: Colors.green,
                fontSize: 12.sp,
              ),
            ),
          ],
        );
      },
    );
  }
}
