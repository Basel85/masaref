class TransactionModel {
  int? id;
  double? price;
  int? subCategoryID;
  int? sectionID;
  int? categoryID;
  int? walletID;
  String? notes;
  String? date;
  String? time;
  String? repeat;
  String? priority;

  TransactionModel(
    this.id,
    this.price,
    this.subCategoryID,
    this.sectionID,
    this.categoryID,
    this.walletID,
    this.notes,
    this.date,
    this.time,
    this.repeat,
    this.priority,
  );

  TransactionModel.fromDB(db) {
    id = db['id'];
    price = db['price'];
    subCategoryID = db['subcategoryid'];
    sectionID = db['sectionid'];
    categoryID = db['categoryid'];
    walletID = db['walletid'];
    notes = db['notes'];
    date = db['date'];
    time = db['time'];
    repeat = db['repeat'];
    priority = db['priority'];
  }
}
