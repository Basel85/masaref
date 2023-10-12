import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/cubits/image_picker/image_picker_cubit.dart';
import 'package:masaref/core/widgets/custom_app_bar.dart';
import 'package:masaref/core/widgets/get_error_message.dart';
import 'package:masaref/features/add_new_wallet/cubits/check_box/check_box_cubit.dart';
import 'package:masaref/features/add_new_wallet/presentation/add_new_wallet.dart';
import 'package:masaref/features/update_wallet/cubits/delete_wallet/delete_wallet_cubit.dart';
import 'package:masaref/features/update_wallet/presentation/update_wallet_screen.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_cubit.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_states.dart';
import 'package:masaref/features/wallets/presentation/widgets/total_balance.dart';
import 'package:masaref/features/wallets/presentation/widgets/wallet_card/wallet_card.dart';

class WalletsScreen extends StatefulWidget {
  const WalletsScreen({super.key});

  @override
  State<WalletsScreen> createState() => _WalletsScreenState();
}

class _WalletsScreenState extends State<WalletsScreen> {
  @override
  void initState() {
    GetAllWalletsCubit.get(context).getAllWallets();
    super.initState();
  }

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
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<CheckBoxCubit>(
                      create: (_) => CheckBoxCubit(),
                    ),
                  ],
                  child: const AddNewWalletScreen(),
                );
              }));
            },
          ),
        ],
      ),
      body: BlocBuilder<GetAllWalletsCubit, GetAllWalletsStates>(
          builder: (_, state) {
        if (state is GetAllWalletsSuccessState) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            children: [
              TotalBalance(
                totalBalance: state.totalBalance,
              ),
              SizedBox(height: 20.h),
              ...List.generate(
                  state.wallets.length,
                  (index) => Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MultiBlocProvider(
                                          providers: [
                                            BlocProvider<ImagePickerCubit>(
                                              create: (_) => ImagePickerCubit(),
                                            ),
                                            
                                            BlocProvider<DeleteWalletCubit>(
                                                create: (_) =>
                                                    DeleteWalletCubit())
                                          ],
                                          child: UpdateWalletScreen(
                                              name: state.wallets[index].name,
                                              balance:
                                                  state.wallets[index].balance,
                                              walletId: state.wallets[index].id,
                                              imagePath:
                                                  state.wallets[index].image),
                                        )));
                          },
                          child: WalletCard(
                            color: state.wallets[index].color,
                            walletName: state.wallets[index].name,
                            balance: state.wallets[index].balance,
                            image: state.wallets[index].image,
                          ),
                        ),
                      ))
            ],
          );
        } else if (state is GetAllWalletsErrorState) {
          return GetErrorMessage(
              errorMessage: state.errorMessage,
              onPressed: () {
                GetAllWalletsCubit.get(context).getAllWallets();
              });
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      }),
    );
  }
}
