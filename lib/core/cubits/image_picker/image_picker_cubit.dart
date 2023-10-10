import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masaref/core/cubits/image_picker/image_picker_states.dart';

class ImagePickerCubit extends Cubit<ImagePickerStates> {
  ImagePickerCubit() : super(ImagePickerInitialState());
  File? _imagePath;
  File? get imagePath => _imagePath;
  static ImagePickerCubit get(context) => BlocProvider.of(context);
  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _imagePath = File(pickedImage.path);
      emit(ImagePickerPickedState(imagePath: _imagePath!));
    } else {
      emit(ImagePickerErrorState(errorMessage: "Something went wrong"));
    }
  }
}
