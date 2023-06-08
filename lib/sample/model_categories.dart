// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:selina/date_base/date_base.dart';

// шаблон распределения элементов в КАТЕГОРИЯХ

class ModelCategories extends StatefulWidget {
  const ModelCategories({Key? key}) : super(key: key);

  @override
  State<ModelCategories> createState() => _ModelCategoriesState();
}

class _ModelCategoriesState extends State<ModelCategories> {
  List<String> product = DateBase().productId;
  List<num> money = DateBase().productMoney;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: product.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
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
                              product[index], //наименование - артикул
                            )
                          ]),
                    ),
                    Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Text(
                            money[index].toString(), //цена
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink[100]),
                            child: const Text('у кошик'),
                            onPressed: () {
                              const snackBar = SnackBar(
                                content: Text('гарний вибір'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                          )
                        ])),
                    Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [Text('додатковий текст-опис')]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
