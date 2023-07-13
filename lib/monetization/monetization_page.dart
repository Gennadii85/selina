import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../date_base/date_goods.dart';
import '../registration/registration_page.dart';
import 'drawer_monetization.dart';

class MonetizationPage extends StatefulWidget {
  const MonetizationPage({super.key});

  @override
  State<MonetizationPage> createState() => _MonetizationPageState();
}

class _MonetizationPageState extends State<MonetizationPage> {
  List<String> productId = DateBase().productId;
  List<num> productMoney = DateBase().productMoney;
  List<int> counter = List.generate(DateBase().productId.length, (index) => 0);

  Future _openBox() async {
    await Hive.openBox('user');
  }

  _createOrder() {
    if (Hive.box('user').values.isEmpty) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Registration()));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                  'Ваш заказ отправлен мы свяжемся с Вами в ближайшее время'),
              content: Text(
                  'Общая стоимость заказа ${productMoney.reduce((value, element) => value + element)} грн.'),
              actions: [
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue.shade50),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK')),
              ],
            );
          });
    }
  }

  @override
  void initState() {
    _openBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const DrawerMonetization(),
        appBar: AppBar(
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        'Выбранно позиций '),
                  ),
                  Expanded(
                    child: Text(
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        '${productId.length}'),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        'На общую сумму '),
                  ),
                  Expanded(
                    child: Text(
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        '${productMoney.reduce((value, element) => value + element)} грн.'),
                  ),
                ],
              )
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.pink.shade50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  _createOrder();
                },
                child: const Text(
                  'Заказать',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: productId.length,
          itemBuilder: (context, index) => Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 6,
            color: Colors.amber.shade100,
            semanticContainer: true,
            child: InkResponse(
              borderRadius: BorderRadius.circular(50),
              containedInkWell: true,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink[100]),
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          if (counter[index] > 0) {
                            int cas = counter[index];
                            cas = cas - 1;
                            counter.removeAt(index);
                            counter.insert(index, cas);
                            setState(() {});
                          } else {}
                        },
                      ),
                      Text(counter[index].toString()),
                      IconButton(
                        // style: ElevatedButton.styleFrom(
                        //     backgroundColor: Colors.pink[100]),
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {
                          int cas = counter[index];
                          cas = cas + 1;
                          counter.removeAt(index);
                          counter.insert(index, cas);
                          setState(() {});
                        },
                      )
                    ],
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
