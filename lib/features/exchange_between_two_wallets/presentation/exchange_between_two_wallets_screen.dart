// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:masaref/core/utils/app_colors.dart';
// import 'package:masaref/features/exchange_between_two_wallets/presentation/widgets/exchange_button.dart';
// import 'package:masaref/features/exchange_between_two_wallets/presentation/widgets/from_wallet.dart';
// import 'package:masaref/core/widgets/price_text_form_field.dart';
// import 'package:masaref/features/exchange_between_two_wallets/presentation/widgets/to_wallet.dart';

// class ExchangeBetweenTwoWallets extends StatelessWidget {
//   const ExchangeBetweenTwoWallets({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColors.primaryColor,
//         ),
//         body: Directionality(
//           textDirection: TextDirection.rtl,
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView(
//                   padding: EdgeInsets.symmetric(vertical: 90.h),
//                   children: [
//                     const PriceTextFormField(),
//                     SizedBox(
//                       height: 16.h,
//                     ),
//                     const FromWallet(),
//                     SizedBox(
//                       height: 16.h,
//                     ),
//                     const ToWallet()
//                   ],
//                 ),
//               ),
//               const ExchangeButton()
//             ],
//           ),
//         ));
//   }
// }
