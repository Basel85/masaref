import 'dart:io';

abstract class ImagePickerStates {}

class ImagePickerInitialState extends ImagePickerStates {}

class ImagePickerPickedState extends ImagePickerStates {
  final File imagePath;
  ImagePickerPickedState({required this.imagePath});
}

class ImagePickerErrorState extends ImagePickerStates {
  final String errorMessage;

  ImagePickerErrorState({required this.errorMessage});
}
