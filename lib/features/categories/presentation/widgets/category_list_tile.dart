import 'package:flutter/material.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_list_tile.dart';

class CategoryListTile extends StatelessWidget {
  final String title;
  final String image;
  const CategoryListTile({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: title,
      image: image,
      textColor: AppColors.colorBlack,
    );
  }
}
