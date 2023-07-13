// ignore_for_file: non_constant_identifier_names

import 'package:selina/date_base/connect.dart';

class DateBase {
  List<String> productId = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 's', 'w', 't'];
  List<num> productMoney = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List? productIcon;
}

class Goods {
  final _sqlConnect = MySql().sqlConnect;

  int category_id;
  String code;
  double price;

  Goods({required this.category_id, required this.code, required this.price});

// query('SELECT FROM users WHERE id = ?', [userId]) так получим нужные товары из категории
// id придет из кнопки и станет в запрос

  // List<int> categories_id = [];

  // Future getCategoriesID() async {
  //   final connection = await _sqlConnect;
  //   var results = await connection.query(
  //       'SELECT price FROM goods WHERE id = $category_id'); //ascacacaaccccc
  //   categories_id = results
  //       .map((e) => int.tryParse(e.values!.first.toString()))
  //       .cast<int>()
  //       .toList();
  //   // print(categories_id);
  //   return categories_id;
  // }
}
