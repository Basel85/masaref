import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/wallets/presentation/widgets/wallet_card/avaliable_balance.dart';
import 'package:masaref/features/wallets/presentation/widgets/wallet_card/wallet_list_tile.dart';

class WalletCard extends StatefulWidget {
  const WalletCard({super.key});

  @override
  State<WalletCard> createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  final Random _random = Random();
  int _r = 0;
  int _g = 0;
  int _b = 0;

  @override
  void initState() {
    _r = _random.nextInt(256);
    _g = _random.nextInt(256);
    _b = _random.nextInt(256);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: ShapeDecoration(
            color: Color.fromARGB(255, _r, _g, _b),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            children: [
              const WalletListTile(),
              SizedBox(height: 10.h),
              const AvaliableBalance(),
              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 60.w,
                  ),
                  Icon(
                    Icons.visibility,
                    size: 24.r,
                    color: AppColors.colorGrey,
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 8.w,
          bottom: 8.h,
          child: Icon(
            Icons.lock,
            size: 24.r,
            color: AppColors.colorGrey,
          ),
        ),
      ],
    );
  }
}
