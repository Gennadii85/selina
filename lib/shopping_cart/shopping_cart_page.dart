import 'package:flutter/material.dart';

import '../date_base/date_base.dart';
import 'drawer_shopping_cart.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<String> productId = DateBase().productId;
  List<num> productMoney = DateBase().productMoney;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const DrawerShoppingCart(),
        appBar: AppBar(
            centerTitle: true,
            title: Column(children: [
              Text('Выбранно позиций ${productId.length}'),
              Text(
                  'На общую сумму ${productMoney.reduce((value, element) => value + element)} грн.')
            ])),
        body: ListView.builder(
          itemCount: productId.length,
          itemBuilder: (context, index) => Card(
            elevation: 6,
            color: Colors.amber.shade100,
            semanticContainer: true,
            child: InkResponse(
              containedInkWell: true,
              highlightShape: BoxShape.rectangle,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Ink.image(
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                      image: const AssetImage('assets/podveski.png'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(productId[index]), //наименование товара
                          Text((productMoney[index]).toString()), //цена товара
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
