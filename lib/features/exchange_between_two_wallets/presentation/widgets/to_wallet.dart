import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/features/exchange_between_two_wallets/presentation/widgets/from_to_wallet.dart';

class ToWallet extends StatelessWidget {
  const ToWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: const FromToWallet(text: "إلى:"),
    );
  }
}
