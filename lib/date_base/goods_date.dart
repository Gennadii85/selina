// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

import 'connect.dart';

class DateBase {
  List<String> productId = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 's', 'w', 't'];
  List<num> productMoney = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List? productIcon;
}

class GoodsDate {
  final String goods_code;
  final double goods_price;
  final String goods_photo;
  GoodsDate({
    required this.goods_code,
    required this.goods_price,
    required this.goods_photo,
  });
  static Future<List<GoodsDate>> getGoods() async {
    List<GoodsDate> productList = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('id_categories');
    print(id);
    final connection = await MySql().sqlConnect;
    var results = await connection
        .query('SELECT code,price,photo FROM goods WHERE  category_id = $id');
    for (var e in results) {
      print(e.fields.values.last);

      if (e.fields.values.last == null) {
        e.fields.values.last == 0;
      } else {
        final prof = GoodsDate(
            goods_code: e['code'],
            goods_price: e['price'],
            goods_photo: e['photo']);
        productList.add(prof);
      }
    }
    return productList;
  }
}
