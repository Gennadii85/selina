// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:mysql1/mysql1.dart';

class MySql {
  var sqlConnect = MySqlConnection.connect(ConnectionSettings(
      host: '116.202.86.252',
      port: 3306,
      user: 'graflin_selina',
      password: 'Si1en_TanTa3',
      db: 'graf_selina'));

  // List<dynamic> goods_price = [];

  // Future getGoodsPrice() async {
  //   final connection = await sqlConnect;
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final int? id = prefs.getInt('id_categories');
  //   var results = await connection
  //       .query('SELECT price FROM goods WHERE  category_id = $id');
  //   goods_price = results.map((e) => e.values!.first.toString()).toList();
  //   // print(goods);

  //   return goods_price;
  // }

  // List<dynamic> goods_code = [];

  // Future getGoodsCode() async {
  //   final connection = await sqlConnect;
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final int? id = prefs.getInt('id_categories');
  //   var results = await connection
  //       .query('SELECT  code FROM goods WHERE  category_id = $id');
  //   goods_code = results.map((e) => e.values!.first.toString()).toList();
  //   // print(goods);

  //   return goods_code;
  // }

  // List<dynamic> goods_photo = [];

  // Future getGoodsPhoto() async {
  //   final connection = await sqlConnect;
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final int? id = prefs.getInt('id_categories');
  //   var results = await connection
  //       .query('SELECT  photo FROM goods WHERE  category_id = $id');
  //   goods_photo = results.map((e) => e.values!.first.toString()).toList();
  //   // print(goods);

  //   return goods_photo;
  // }
}
