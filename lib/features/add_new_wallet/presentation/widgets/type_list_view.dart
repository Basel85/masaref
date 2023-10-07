import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypeListView extends StatelessWidget {
  final String text;
  final Widget? subTitle;
  final void Function() onTap;
  const TypeListView({super.key, required this.text, required this.onTap, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 20.r,
        ),
        subtitle: subTitle,
        title: Text(text),
        trailing: Icon(
          Icons.arrow_drop_down,
          size: 24.r,
        ),
      ),
    );
  }
}
