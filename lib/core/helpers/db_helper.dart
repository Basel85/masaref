import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static late Database database;

  static _onConfigure(Database db) async {
    database = db;
    await db.execute("PRAGMA foreign_keys = ON");
  }

  static _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE Wallet (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            balance REAL,
            name TEXT,
            image TEXT,
            color INTEGER
            )''');
    await db.execute('''CREATE TABLE Section (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
            )''');
    await db.execute('''CREATE TABLE Category (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            sectionid INTEGER,
            name TEXT,
            image TEXT,
            FOREIGN KEY (sectionid) REFERENCES Section (id)
            )''');
    await db.execute('''CREATE TABLE SubCategory (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            categoryid INTEGER,
            name TEXT,
            image TEXT,
            FOREIGN KEY (categoryid) REFERENCES Category (id)
            )''');
    await db.execute('''CREATE TABLE Trans_action (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            price REAL,
            sectionid INTEGER,
            categoryid INTEGER,
            walletid INTEGER,
            notes TEXT,
            date TEXT,
            time TEXT,
            repeat TEXT,
            priority TEXT,
            FOREIGN KEY (sectionid) REFERENCES Section (id),
            FOREIGN KEY (categoryid) REFERENCES Category (id),
            FOREIGN KEY (walletid) REFERENCES Wallet (id)
            )''');
    await insertIntoSection(name: "النفقات");
    await insertIntoSection(name: "الدخل");
    await insertIntoCategory(sectionid: 1, name: "الطعام", image: "");
    await insertIntoCategory(sectionid: 2, name: "الراتب", image: "");
  }

  static createDatabase() async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, 'masaref48.db');
    database = await openDatabase(
      path,
      version: 2,
      onConfigure: _onConfigure,
      // onUpgrade: (db, oldVersion, newVersion) async {

      // },
      onCreate: _onCreate,
      onOpen: (db) async {
        // print(await getAll('Trans_action'));
      },
    );
  }

  static Future<List<Map>> getAll(String tableName) async {
    return await database.rawQuery('SELECT * FROM $tableName');
  }


  static Future<List<Map<String, dynamic>>> getspecificCategoryName(
      {required int catyid}) async {
    return await database
        .rawQuery('''SELECT name FROM Category WHERE id = $catyid ''');
  }

  static Future<List<Map<String, dynamic>>> getTransactionOfSpecificDate(
      {required String date}) async {
    return await database
        .rawQuery('''SELECT * FROM Trans_action WHERE date = '$date' ''');
  }

  static Future<List<Map<String, dynamic>>> getCategoriesOfSpecificSection(
      {required int sectionId}) async {
    return await database
        .rawQuery('SELECT * FROM Category WHERE sectionid = $sectionId');
  }

  static Future<List<Map<String, dynamic>>> getSubCategoriesOfSpecificCategory(
      {required int categoryId}) async {
    return await database
        .rawQuery('SELECT * FROM SubCategory WHERE categoryid = $categoryId');
  }

  static Future insertIntoSection({required String name}) async {
    await database.transaction((txn) async {
      txn
          .rawInsert('INSERT INTO Section(name) VALUES("$name")')
          .then((value) {});
    });
  }

  static Future insertIntoCategory(
      {required int sectionid,
      required String name,
      required String image}) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO Category(sectionid,name,image) VALUES("$sectionid", "$name", "$image")')
          .then((value) {
        getAll('Category');
      });
    });
  }

  static Future insertIntoSubCategory(
      {required int categoryid,
      required String name,
      required String image}) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO SubCategory(categoryid,name,image) VALUES("$categoryid", "$name", "$image")')
          .then((value) {
        getAll('SubCategory');
      });
    });
  }

  static Future insertIntoWallet(
      {required double balance,
      required String name,
      required String image,
      required int color}) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO Wallet(balance,name,image,color) VALUES("$balance","$name","$image","$color")')
          .then((value) {
        getAll('Wallet');
      }).catchError((error) {
        throw (error.toString());
      });
    });
  }

  static Future insertIntoTransaction(
      {required double price,
      required int sectionid,
      required int categoryid,
      required int walletid,
      required String notes,
      required String date,
      required String time,
      required String repeat,
      required int priority}) async {
    await database.transaction((txn) async {
      txn.rawInsert('''INSERT INTO Trans_action
          (price,sectionid,categoryid,walletid,
          notes,date,time,repeat,priority) 
          VALUES("$price", "$sectionid", "$categoryid", "$walletid",
           "$notes", "$date", "$time", "$repeat", "$priority")''').then((value) {
        getAll('Trans_action');
      });
    });
  }



  static Future deleteFromAll(int id, String tableName) async {
   await database.rawDelete('DELETE FROM $tableName WHERE id = ?', [id]);
  }

  static void updateRecordonWallet(
      {required int id,
      required double balance,
      required String name,
      required String image}) async {
    await database.rawUpdate(
        '''UPDATE Wallet SET balance = ?, name = ?, image = ? WHERE id = ?''',
        [balance, name, image, id]);
  }

  static Future updateRecordonTransaction(
      {required int id,
      required double price,
      required int sectionid,
      required int categoryid,
      required int walletid,
      required String notes,
      required String date,
      required String time,
      required String repeat,
      required String priority}) async {
    await database.rawUpdate(
        '''UPDATE Trans_action SET price = ?, sectionid = ?, 
        categoryid = ?, walletid = ?,
        notes = ?, date = ?, time = ?,
        repeat = ?, priority = ?
        WHERE id = ?''',
        [
          price,
          sectionid,
          categoryid,
          walletid,
          notes,
          date,
          time,
          repeat,
          priority,
          id
        ]);
  }
}
