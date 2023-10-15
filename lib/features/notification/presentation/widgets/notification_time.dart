import 'package:flutter/material.dart';
import 'package:masaref/features/notification/presentation/widgets/notification_time_text.dart';
import 'package:masaref/features/notification/presentation/widgets/switch_button.dart';

class NotificationTime extends StatelessWidget {
  const NotificationTime({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NotificationTimeText(),
        SwitchButton()
      ],
    );
  }
}
