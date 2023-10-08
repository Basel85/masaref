import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FromToWallet extends StatelessWidget {
  final String text;
  const FromToWallet({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 20.r,
            ),
            title: const Text(
              "المحفظة",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
