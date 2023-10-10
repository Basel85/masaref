import 'package:flutter/material.dart';

class GetErrorMessage extends StatelessWidget {
  final String errorMessage;
  final void Function() onPressed;
  const GetErrorMessage(
      {super.key, required this.errorMessage, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage),
          ElevatedButton(onPressed: onPressed, child: const Text("Retry"))
        ],
      ),
    );
  }
}
