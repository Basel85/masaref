import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static late Database database;

  _onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
  }

  _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE Transaction (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            price REAL,
            subcategoryid INTEGER,
            sectionid INTEGER,
            categoryid INTEGER,
            walletid INTEGER,
            notes TEXT,
            date TEXT,
            time TEXT,
            repeat TEXT,
            priority TEXT,
            FOREIGN KEY (subcategoryid) REFERENCES SubCategory (id),
            FOREIGN KEY (sectionid) REFERENCES Section (id),
            FOREIGN KEY (categoryid) REFERENCES Category (id),
            FOREIGN KEY (walletid) REFERENCES Wallet (id)
            )''');
    await db.execute('''CREATE TABLE Wallet (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            balance REAL
            name TEXT,
            image TEXT
            )''');
    await db.execute('''CREATE TABLE Section (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
            )''');
    await db.execute('''CREATE TABLE Category (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            sectionid INTEGER
            name TEXT,
            image TEXT,
            FOREIGN KEY (sectionid) REFERENCES Section (id)
            )''');
    await db.execute('''CREATE TABLE SubCategory (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            categoryid INTEGER
            name TEXT,
            image TEXT,
            FOREIGN KEY (categoryid) REFERENCES Category (id)
            )''');
  }

  createDatabase() async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, 'masaref.db');
    openDatabase(
      path,
      version: 1,
      onConfigure: _onConfigure,
      onCreate: _onCreate,
      onOpen: (db) async {
      },
    ).then((value) {
      database = value;
    });
  }

  Future<List<Map>> getAll(Database database, String tableName) async {
    return await database.rawQuery('SELECT * FROM $tableName');
  }

  Future insertIntoSection({required int id, required String name}) async {
    await database.transaction((txn) async {
      txn
          .rawInsert('INSERT INTO Section(id,name) VALUES("$id", "$name")')
          .then((value) {});
    });
  }

  Future insertIntoCategory(
      {required int id,
      required int sectionid,
      required String name,
      required String image}) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO Category(id,sectionid,name,image) VALUES("$id", "$sectionid", "$name", "$image")')
          .then((value) {
        getAll(database, 'Category');
      });
    });
  }

  Future insertIntoSubCategory(
      {required int id,
      required int categoryid,
      required String name,
      required String image}) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO SubCategory(id,categoryid,name,image) VALUES("$id", "$categoryid", "$name", "$image")')
          .then((value) {
        getAll(database, 'SubCategory');
      });
    });
  }

  Future insertIntoWallet(
      {required int id,
      required double balance,
      required String name,
      required String image}) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO Wallet(id,balance,name,image) VALUES("$id", "$balance", "$name", "$image")')
          .then((value) {
        getAll(database, 'Wallet');
      });
    });
  }

  Future insertIntoTransaction(
      {required int id,
      required double price,
      required int subcategoryid,
      required int sectionid,
      required int categoryid,
      required int walletid,
      required String notes,
      required String date,
      required String time,
      required String repeat,
      required String priority}) async {
    await database.transaction((txn) async {
      txn.rawInsert('''INSERT INTO Trans_action
          (id,price,subcategoryid,sectionid,categoryid,walletid,
          notes,date,time,repeat,priority) 
          VALUES("$id", "$price", "$subcategoryid", "$sectionid", "$categoryid", "$walletid",
           "$notes", "$date", "$time", "$repeat", "$priority")''').then((value) {
        getAll(database, 'Transaction');
      });
    });
  }

  void deleteFromAll(int id, String tableName) {
    database
        .rawDelete('DELETE FROM $tableName WHERE id = ?', [id]).then((value) {
      getAll(database, tableName);
    });
  }

  void updateRecordonWallet(
      {required int id, required double balance, required String name}) {
    database.rawUpdate(
        '''UPDATE Wallet SET balance = ? name = ? WHERE id = ?''',
        [balance, name, id]).then((value) {
      getAll(database, 'Wallet');
    });
  }

  void updateRecordonTransaction(
      {required int id,
      required double price,
      required int subcategoryid,
      required int sectionid,
      required int categoryid,
      required int walletid,
      required String notes,
      required String date,
      required String time,
      required String repeat,
      required String priority}) {
    database.rawUpdate('''UPDATE Trans_action SET price = ? 
        subcategoryid = ? sectionid = ? 
        categoryid = ? walletid = ? 
        notes = ? date = ? time = ? 
        repeat = ? priority = ? 
        WHERE id = ?''', [
      price,
      subcategoryid,
      sectionid,
      categoryid,
      walletid,
      notes,
      date,
      time,
      repeat,
      priority,
      id
    ]).then((value) {
      getAll(database, 'Transaction');
    });
  }
}
