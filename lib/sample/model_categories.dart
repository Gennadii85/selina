// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:selina/date_base/connect.dart';

// шаблон распределения элементов в КАТЕГОРИЯХ

class ModelCategories extends StatefulWidget {
  const ModelCategories({Key? key}) : super(key: key);

  @override
  State<ModelCategories> createState() => _ModelCategoriesState();
}

class _ModelCategoriesState extends State<ModelCategories> {
  // @override
  // void initState() {
  //   super.initState();
  //   MySql().getGoods();
  // }

  // var product = MySql().goods;
  var date = MySql();
  @override
  Widget build(BuildContext context) {
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
          future: Future.wait([
            date.getGoodsPrice(),
            date.getGoodsCode(),
            date.getGoodsPhoto()
          ]),
          builder: (context, snapshot) {
            List<dynamic> code = [];
            List<dynamic> price = [];
            List<dynamic> photo = [];

            price = date.goods_price;
            code = date.goods_code;
            photo = date.goods_photo;
            // print(code);
            if (snapshot.hasData) {
              // print(code);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: code.length,
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
                              image: NetworkImage('${photo[index]}'),
                              // ('${photo[index]}'),
                            ),
                          ),
                          Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    code[index], //наименование - артикул
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
                                    price[index], //цена
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
