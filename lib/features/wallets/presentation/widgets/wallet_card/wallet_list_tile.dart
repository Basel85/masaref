import 'package:flutter/material.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_list_tile.dart';

class WalletListTile extends StatelessWidget {
  final String walletName;
  final String image;
  const WalletListTile(
      {super.key, required this.walletName, required this.image});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: walletName,
      image: image,
      textColor: AppColors.colorWhite,
      // trailing: const Icon(Icons.keyboard_arrow_down),
    );
  }
}
