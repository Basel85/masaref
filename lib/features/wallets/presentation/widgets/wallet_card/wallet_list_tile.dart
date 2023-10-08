import 'package:flutter/material.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_list_tile.dart';

class WalletListTile extends StatelessWidget {
  const WalletListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomListTile(
      title: "مصروف الشهر",
      textColor: AppColors.colorWhite,
      trailing: Icon(Icons.keyboard_arrow_down),
    );
  }
}
