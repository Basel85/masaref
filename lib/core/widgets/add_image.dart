import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/cubits/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/cubits/image_picker/image_picker_cubit.dart';
import 'package:masaref/core/cubits/image_picker/image_picker_states.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/snack_bar_viewer.dart';

class AddImage extends StatelessWidget with SnackBarViewer {
  final String imagePath;
  const AddImage({super.key, this.imagePath = ""});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ImagePickerCubit.get(context).pickImage();
      },
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        leading: BlocConsumer<ImagePickerCubit, ImagePickerStates>(
          listener: (context, state) {
            if (state is ImagePickerErrorState) {
              showSnackBar(
                  context: context,
                  message: state.errorMessage,
                  backgroundColor: Colors.red);
            }
          },
          listenWhen: (previous, current) => current is ImagePickerErrorState,
          buildWhen: (previous, current) => current is ImagePickerPickedState,
          builder: (_, state) => CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 20.r,
            backgroundImage: state is ImagePickerPickedState
                ? FileImage(File(state.imagePath))
                : imagePath != ""
                    ? FileImage(File(imagePath))
                    : null,
          ),
        ),
        title: Text(
          "اضف صورة",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: BlocProvider.of<WholeAppCubit>(context).isdark
                ? AppColors.colorWhite
                : AppColors.colorBlack,
          ),
        ),
      ),
    );
  }
}
