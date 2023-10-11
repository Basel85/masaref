import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';
import 'package:masaref/features/main/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:masaref/features/main/cubits/bottom_navigation_bar/bottom_navigation_bar_states.dart';
import 'package:masaref/features/mo3amala/presentation/view/mo3amala.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/mo3amalat_tap.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_cubit.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_states.dart';
import 'package:masaref/features/wallets/presentation/wallets_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<GetAllWalletsCubit, GetAllWalletsStates>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              elevation: 0,
              backgroundColor: AppColors.colorPurple,
              onPressed: () {
                GetAllWalletsCubit.get(context).getAllWallets();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Mo3amalaPage(
                              toAdd: true,
                              walletList: state is GetAllWalletsSuccessState
                                  ? state.wallets
                                  : [],
                            )));
              },
              child: const Icon(Icons.add),
            ),
            body: BlocBuilder<BottomNavigationBarCubit,
                BottomNavigationBarStates>(
              builder: (_, state) => IndexedStack(
                index:
                    state is BottomNavigationBarChangedState ? state.index : 0,
                children: [
                  const Directionality(
                      textDirection: TextDirection.rtl, child: Mo3amalatTap()),
                  Container(),
                  const Directionality(
                      textDirection: TextDirection.rtl, child: WalletsScreen()),
                  Container(),
                ],
              ),
            ),
            bottomNavigationBar: BlocBuilder<BottomNavigationBarCubit,
                BottomNavigationBarStates>(
              builder: (_, state) => BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.primaryColor,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                iconSize: 24.r,
                selectedLabelStyle: AppStyles.textStyle14PrimaryColor,
                unselectedLabelStyle: AppStyles.textStyle14PrimaryColor,
                unselectedItemColor: AppColors.colorGrey,
                onTap: (index) {
                  BottomNavigationBarCubit.get(context).update(index: index);
                },
                currentIndex:
                    state is BottomNavigationBarChangedState ? state.index : 0,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'الرئيسية',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.money),
                    label: ' الميزانية',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance_wallet),
                    label: 'المحفظات',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.more_rounded),
                    label: 'المزيد',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
