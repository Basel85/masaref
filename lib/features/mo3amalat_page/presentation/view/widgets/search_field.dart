import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/mo3amalat_page/cubits/search/search_cubit.dart';

class SearchField extends StatefulWidget {
  final List<String> categorynamesList;

  const SearchField({
    super.key,
    required this.categorynamesList,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onChanged: (_) {
        SearchCubit.get(context)
            .search(_searchController.text, widget.categorynamesList);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorBlack.withOpacity(0.05),
        hintText: 'بحث',
        hintStyle: TextStyle(
          color: BlocProvider.of<WholeAppCubit>(context).isdark
              ? AppColors.colorWhite
              : AppColors.colorBlack,
          fontSize: 12.sp,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: BlocProvider.of<WholeAppCubit>(context).isdark
              ? AppColors.colorWhite
              : AppColors.colorBlack,
        ),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
    );
  }
}
