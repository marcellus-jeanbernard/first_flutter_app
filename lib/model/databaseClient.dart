import 'dart:io';
import 'package:code_base/model/Item.dart';
import 'package:path/path.dart';
import 'package:path/path.dart';
import 'dart:async';
// ignore: uri_does_not_exist
import 'package:sqflite/sqflite.dart';
class DatabaseClient {
  Future<Database> get database async {
    if (database != null){
      return __database;
    } else
      // creer cette database
        _database = await create();
  }

  Future create() async {
   Directory directory = await getApplicationDocumentsDirectory();
   String database_directory = join(directory.path, 'database.db');

   var bdd = await openDatabase(database_directory, version: 1, onCreate: _onCreate );
       return bdd;
  }
  Future _oncreate(Database db, int version) async{
     await db.execute('''
       CREATE TABLE item {
       id INTEGER PRIMARY KEY,
        nom TEXT NOT NULL) 
       ''');

  }

  /* ECRITURE DES DONNEES */
  Future<Item> ajouterItem(Item item) async {
     Database maDatabase = await database;
     item.id= await maDatabase.insert('item', item.toMap());
     return item;
  }

/* LECTURE DES DONNEES */
  Future<List<Item> allItem() async {
    Database maDatabase = await database;
    List<Map><String, dynamic>> resultat =
    await maDatabase.rawQuery('SELECT * FROM item');
    List<Item> items = [];
    resultat.forEach((map){
      Item item = new Item();
      item.fromMap(map);
      items.add(item);

    });
    return items;

  }

}