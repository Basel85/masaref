import 'package:flutter/material.dart';

mixin SnackBarViewer {
  void showSnackBar({required BuildContext context, required String message,Color backgroundColor = Colors.black}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
