import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/mo3amalat_by_day_item.dart';

class Mo3amalatByDayList extends StatelessWidget {
  const Mo3amalatByDayList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        if (BlocProvider.of<
                    WholeAppCubit>(context)
                .transactionDate1list
                .isEmpty &&
            BlocProvider.of<
                    WholeAppCubit>(context)
                .transactionDate2list
                .isEmpty &&
            BlocProvider.of<
                    WholeAppCubit>(context)
                .transactionDate3list
                .isEmpty &&
            BlocProvider.of<
                    WholeAppCubit>(context)
                .transactionDate4list
                .isEmpty &&
            BlocProvider.of<
                    WholeAppCubit>(context)
                .transactionDate5list
                .isEmpty &&
            BlocProvider.of<WholeAppCubit>(context)
                .transactionDate6list
                .isEmpty &&
            BlocProvider.of<WholeAppCubit>(context)
                .transactionDate7list
                .isEmpty)
          const Center(
            child: Text('لا&&'),
          ),
        if (BlocProvider.of<WholeAppCubit>(context)
            .transactionDate1list
            .isNotEmpty)
          Mo3amalatByDayContainer(
              tList:
                  BlocProvider.of<WholeAppCubit>(context).transactionDate1list),
        if (BlocProvider.of<WholeAppCubit>(context)
            .transactionDate2list
            .isNotEmpty)
          Mo3amalatByDayContainer(
              tList:
                  BlocProvider.of<WholeAppCubit>(context).transactionDate2list),
        if (BlocProvider.of<WholeAppCubit>(context)
            .transactionDate3list
            .isNotEmpty)
          Mo3amalatByDayContainer(
              tList:
                  BlocProvider.of<WholeAppCubit>(context).transactionDate3list),
        if (BlocProvider.of<WholeAppCubit>(context)
            .transactionDate4list
            .isNotEmpty)
          Mo3amalatByDayContainer(
              tList:
                  BlocProvider.of<WholeAppCubit>(context).transactionDate4list),
        if (BlocProvider.of<WholeAppCubit>(context)
            .transactionDate5list
            .isNotEmpty)
          Mo3amalatByDayContainer(
              tList:
                  BlocProvider.of<WholeAppCubit>(context).transactionDate5list),
        if (BlocProvider.of<WholeAppCubit>(context)
            .transactionDate6list
            .isNotEmpty)
          Mo3amalatByDayContainer(
              tList:
                  BlocProvider.of<WholeAppCubit>(context).transactionDate6list),
        if (BlocProvider.of<WholeAppCubit>(context)
            .transactionDate7list
            .isNotEmpty)
          Mo3amalatByDayContainer(
              tList:
                  BlocProvider.of<WholeAppCubit>(context).transactionDate7list),
      ],
    );
  }
}
