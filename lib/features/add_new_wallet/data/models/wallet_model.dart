class WalletModel {
  final int id;
  final double balance;
  final String name;
  final String image;
  final int color;
  WalletModel(
      {required this.id,
      required this.balance,
      required this.name,
      required this.image,
      required this.color});
  factory WalletModel.fromJson({required Map<String, dynamic> json}) {
    return WalletModel(
        id: json['id'],
        balance: json['balance'],
        name: json['name'],
        image: json['image'],
        color: json['color']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'balance': balance,
      'name': name,
      'image': image,
      'color': color
    };
  }
}
