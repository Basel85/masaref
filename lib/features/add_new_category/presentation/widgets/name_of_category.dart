import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/cubits/image_picker/image_picker_cubit.dart';
import 'package:masaref/core/cubits/image_picker/image_picker_states.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/snack_bar_viewer.dart';
import 'package:masaref/core/widgets/custom_form_field.dart';

class NameOfCategory extends StatelessWidget with SnackBarViewer {
  final TextEditingController categoryController;
  const NameOfCategory({super.key, required this.categoryController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorWhite,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              ImagePickerCubit.get(context).pickImage();
            },
            child: BlocConsumer<ImagePickerCubit, ImagePickerStates>(
              listener: (context, state) {
                if (state is ImagePickerErrorState) {
                  showSnackBar(
                      context: context,
                      message: state.errorMessage,
                      backgroundColor: AppColors.redColor);
                }
              },
              listenWhen: (previous, current) =>
                  current is ImagePickerErrorState,
              buildWhen: (previous, current) =>
                  current is ImagePickerPickedState,
              builder: (_, state) => CircleAvatar(
                radius: 25.r,
                backgroundColor: AppColors.colorLightBlue,
                backgroundImage: state is ImagePickerPickedState
                    ? FileImage(File(state.imagePath))
                    : null,
                child: Icon(
                  Icons.edit,
                  color: AppColors.colorWhite,
                  size: 30.r,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: CustomFormField(
              controller: categoryController,
              hinttext: "اسم القسم ",
              hintsize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
