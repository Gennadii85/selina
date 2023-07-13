// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../date_base/connect.dart';
import '../home_page/drawer_home_page.dart';
import '../sample/model_categories.dart';
import 'categories.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => CategoriesPageState();
}

class CategoriesPageState extends State<CategoriesPage> {
  var date_categories = MySql();
  @override
  void initState() {
    date_categories.getCategoriesID();
    date_categories.getCategoriesName();
    super.initState();
  }

  int id_categories = 124;
  pushID(idd) {
    id_categories = idd;
    // print(id_categories);
    return id_categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerAppBar(),
      appBar: AppBar(
        title: Text(id_categories.toString()),
      ),
      body: FutureBuilder(
          future: date_categories.getCategoriesName(),
          builder: (context, snapshot) {
            List<String> name = [];
            List<int> idd = [];
            name = date_categories.categories_name;
            idd = date_categories.categories_id;
            if (snapshot.hasData) {
              // print(id);
              // print(name);
              return GridView.builder(
                itemCount: name.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                padding: const EdgeInsets.all(5),
                itemBuilder: (BuildContext context, int index) => Categories(
                  image: 'assets/podveski.png',
                  name: name[index].toString(),
                  id: idd[index],
                  coolbackCategories: (idd) {
                    // print(idd);
                    pushID(idd);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ModelCategories()));
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
