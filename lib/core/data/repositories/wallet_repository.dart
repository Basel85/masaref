import 'package:masaref/core/helpers/db_helper.dart';
import 'package:masaref/features/add_new_wallet/data/models/wallet_model.dart';

class WalletRepository {
  static List<Map<String, dynamic>> _wallets = [];
  static void addToWallet(
      {required String name,
      required double balance,
      required String image,
      required int color}) async {
    await DBHelper.insertIntoWallet(
        balance: balance, name: name, image: image, color: color);
  }

  static Future<List<WalletModel>> getAllWallets() async {
    _wallets = await DBHelper.getAll("Wallet") as List<Map<String, dynamic>>;
    return _wallets
        .map((wallet) => WalletModel.fromJson(json: wallet))
        .toList()
        .cast<WalletModel>();
  }

  static void updateWallet(
      {required int id,
      required double balance,
      required String name,
      required String image}) {
    DBHelper.updateRecordonWallet(
        id: id, balance: balance, name: name, image: image);
  }

  static void deleteWallet({required int id}) async{
    await DBHelper.deleteFromAll(id,"Wallet");
  }
}
