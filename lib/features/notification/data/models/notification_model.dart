class NotificationModel {
  final int id;
  final String time;
  final bool isSwitchedOn;

  NotificationModel({required this.id, required this.time, required this.isSwitchedOn});

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'],
      time: map['time'],
      isSwitchedOn: map['is_switched_on'] == 1 ? true : false,
    );
  }
}
