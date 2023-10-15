import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/mo3amalat_by_day_item.dart';

class Mo3amalatByDayList extends StatelessWidget {
  const Mo3amalatByDayList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            if (BlocProvider.of<WholeAppCubit>(context)
                .transactionDate1list
                .isNotEmpty)
              Mo3amalatByDayContainer(
                  tList: BlocProvider.of<WholeAppCubit>(context)
                      .transactionDate1list,
                  index: 0),
            if (BlocProvider.of<WholeAppCubit>(context)
                .transactionDate2list
                .isNotEmpty)
              Mo3amalatByDayContainer(
                  tList: BlocProvider.of<WholeAppCubit>(context)
                      .transactionDate2list,
                  index: 1),
            if (BlocProvider.of<WholeAppCubit>(context)
                .transactionDate3list
                .isNotEmpty)
              Mo3amalatByDayContainer(
                  tList: BlocProvider.of<WholeAppCubit>(context)
                      .transactionDate3list,
                  index: 2),
            if (BlocProvider.of<WholeAppCubit>(context)
                .transactionDate4list
                .isNotEmpty)
              Mo3amalatByDayContainer(
                  tList: BlocProvider.of<WholeAppCubit>(context)
                      .transactionDate4list,
                  index: 3),
            if (BlocProvider.of<WholeAppCubit>(context)
                .transactionDate5list
                .isNotEmpty)
              Mo3amalatByDayContainer(
                  tList: BlocProvider.of<WholeAppCubit>(context)
                      .transactionDate5list,
                  index: 4),
            if (BlocProvider.of<WholeAppCubit>(context)
                .transactionDate6list
                .isNotEmpty)
              Mo3amalatByDayContainer(
                  tList: BlocProvider.of<WholeAppCubit>(context)
                      .transactionDate6list,
                  index: 5),
            if (BlocProvider.of<WholeAppCubit>(context)
                .transactionDate7list
                .isNotEmpty)
              Mo3amalatByDayContainer(
                  tList: BlocProvider.of<WholeAppCubit>(context)
                      .transactionDate7list,
                  index: 6),
          ],
        );
      },
    );
  }
}
