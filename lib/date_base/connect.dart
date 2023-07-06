// ignore_for_file: non_constant_identifier_names

import 'package:mysql1/mysql1.dart';

class MySql {
  var sqlConnect = MySqlConnection.connect(ConnectionSettings(
      host: '116.202.86.252',
      port: 3306,
      user: 'graflin_selina',
      password: 'Si1en_TanTa3',
      db: 'graf_selina'));
  List<String> categories_name = [];

  Future getConnection() async {
    final connection = await sqlConnect;
    var results = await connection.query('SELECT name_ru FROM categories');
    categories_name = results.map((e) => e.values!.first.toString()).toList();
    return categories_name;
  }

  List<String> goods = [];

  Future getGoods() async {
    final connection = await sqlConnect;
    var results = await connection.query('SELECT code FROM goods');
    goods = results.map((e) => e.values!.first.toString()).toList();
    return goods;
  }
}
