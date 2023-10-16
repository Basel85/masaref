import 'package:flutter/material.dart';
import 'package:masaref/features/notification/presentation/widgets/notification_time_text.dart';
import 'package:masaref/features/notification/presentation/widgets/switch_button.dart';

class NotificationTime extends StatelessWidget {
  final int id;
  const NotificationTime({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [NotificationTimeText(id: id,), SwitchButton(id: id,)],
    );
  }
}
