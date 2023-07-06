// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:selina/date_base/connect.dart';

import 'package:selina/date_base/date_base.dart';

// шаблон распределения элементов в КАТЕГОРИЯХ

class ModelCategories extends StatefulWidget {
  var model;
  ModelCategories({Key? key, required this.model}) : super(key: key);

  @override
  State<ModelCategories> createState() => _ModelCategoriesState();
}

class _ModelCategoriesState extends State<ModelCategories> {
  @override
  void initState() {
    super.initState();
    product.getGoods();
  }

  var product = MySql();
  // List<num> money = DateBase().productMoney;
  @override
  Widget build(BuildContext context) {
    print(product.categories_name);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('data'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: FutureBuilder(
          future: MySql().getGoods(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: product.goods.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 240,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                  padding: const EdgeInsets.all(15),
                  itemBuilder: (BuildContext context, int index) => Card(
                    elevation: 6,
                    color: Colors.amber.shade100,
                    semanticContainer: true,
                    child: InkResponse(
                      containedInkWell: true,
                      highlightShape: BoxShape.rectangle,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 9,
                            child: Ink.image(
                              width: double.infinity,
                              height: 240,
                              fit: BoxFit.cover,
                              image: const AssetImage('assets/podveski.png'),
                            ),
                          ),
                          Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    product
                                        .goods[index], //наименование - артикул
                                  )
                                ]),
                          ),
                          Expanded(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    '${product.goods[index]} грн', //цена
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pink[100]),
                                  child: const Text('у кошик'),
                                  onPressed: () {
                                    const snackBar = SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text('гарний вибір'),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                )
                              ])),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Что-то пошло не так'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
