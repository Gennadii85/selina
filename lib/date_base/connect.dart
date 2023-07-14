// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:mysql1/mysql1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../categories/categories_page.dart';

class MySql {
  var sqlConnect = MySqlConnection.connect(ConnectionSettings(
      host: '116.202.86.252',
      port: 3306,
      user: 'graflin_selina',
      password: 'Si1en_TanTa3',
      db: 'graf_selina'));

  Future getCategories() async {
    await getCategoriesName();
    await getCategoriesID();
  }

  List<String> categories_name = [];

  Future getCategoriesName() async {
    final connection = await sqlConnect;
    var results = await connection.query('SELECT name_ru FROM categories');
    categories_name = results.map((e) => e.values!.first.toString()).toList();
    // print(categories_name);
    return categories_name;
  }

  List<int> categories_id = [];

  Future getCategoriesID() async {
    final connection = await sqlConnect;
    var results = await connection.query('SELECT id FROM categories');
    categories_id = results
        .map((e) => int.tryParse(e.values!.first.toString()))
        .cast<int>()
        .toList();
    // print(categories_id);
    return categories_id;
  }

  List<String> goods = [];

  Future getGoods() async {
    final connection = await sqlConnect;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('id_categories');
    var results = await connection
        .query('SELECT price FROM goods WHERE  category_id = $id');
    goods = results.map((e) => e.values!.first.toString()).toList();
    print(prefs.getInt('id_categories').toString());

    return goods;
  }
}
