// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../date_base/connect.dart';
import '../home_page/drawer_home_page.dart';
import '../sample/model_categories.dart';
import 'categories.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  // List<String> categories_name = MySql().categories_name;
  var date_categories_name = MySql();

  @override
  void initState() {
    super.initState();
    date_categories_name.getConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerAppBar(),
      appBar: AppBar(
        title: const Text('Selina'),
      ),
      body: FutureBuilder(
          future: date_categories_name.getConnection(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: date_categories_name.categories_name.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                padding: const EdgeInsets.all(5),
                itemBuilder: (BuildContext context, int index) => Categories(
                  image: 'assets/podveski.png',
                  name: date_categories_name.categories_name[index].toString(),
                  coolbackCategories: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ModelCategories(
                              model: MySql().getGoods(),
                            )));
                  },
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
          }),
    );
  }
}
