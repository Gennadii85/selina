// ignore_for_file: non_constant_identifier_names

import 'connect.dart';

class CategoriesDate {
  final int cat_id;
  final String cat_name;
  final String cat_icon;
  CategoriesDate({
    required this.cat_id,
    required this.cat_name,
    required this.cat_icon,
  });
  static Future<List<CategoriesDate>> getCategories() async {
    List<CategoriesDate> productList = [];
    final connection = await MySql().sqlConnect;
    var results =
        await connection.query('SELECT name_ru,id,icon FROM categories');
    for (var e in results) {
      final prof = CategoriesDate(
          cat_id: e['id'], cat_name: e['name_ru'], cat_icon: e['icon']);
      productList.add(prof);
    }
    return productList;
  }
}
