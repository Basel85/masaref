import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/wallets/presentation/widgets/wallet_card/avaliable_balance.dart';
import 'package:masaref/features/wallets/presentation/widgets/wallet_card/wallet_list_tile.dart';

class WalletCard extends StatelessWidget {
  final int color;
  final String walletName;
  final double balance;
  final String image;
  const WalletCard(
      {super.key,
      required this.color,
      required this.walletName,
      required this.balance,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: ShapeDecoration(
            color: Color(color),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            children: [
              WalletListTile(
                image: image,
                walletName: walletName,
              ),
              SizedBox(height: 10.h),
              AvaliableBalance(
                balance: balance,
              ),
              SizedBox(height: 10.h),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     SizedBox(
              //       width: 60.w,
              //     ),
              //     Icon(
              //       Icons.visibility,
              //       size: 24.r,
              //       color: AppColors.colorGrey,
              //     )
              //   ],
              // )
            ],
          ),
        ),
        // Positioned(
        //   right: 8.w,
        //   bottom: 8.h,
        //   child: Icon(
        //     Icons.lock,
        //     size: 24.r,
        //     color: AppColors.colorGrey,
        //   ),
        // ),
      ],
    );
  }
}
