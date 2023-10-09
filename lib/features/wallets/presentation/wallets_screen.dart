import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/widgets/custom_app_bar.dart';
import 'package:masaref/features/add_new_wallet/presentation/add_new_wallet.dart';
import 'package:masaref/features/wallets/presentation/widgets/total_balance.dart';
import 'package:masaref/features/wallets/presentation/widgets/wallet_card/wallet_card.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "المحفظات",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30.r,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AddNewWalletScreen();
              }));
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        children: [
          const TotalBalance(),
          SizedBox(height: 20.h),
          const WalletCard()
        ],
      ),
    );
  }
}
