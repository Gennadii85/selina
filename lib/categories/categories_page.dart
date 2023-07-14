// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  var date = MySql();

  // @override
  // void initState() {
  //   date_categories.getCategoriesID();
  //   date_categories.getCategoriesName();
  //   super.initState();
  // }

  Future shared(idd) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('id_categories');
    await prefs.setInt('id_categories', idd);
    // return idd;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerAppBar(),
      appBar: AppBar(
        title: const Text('Selina'),
      ),
      body: FutureBuilder(
          future:
              Future.wait([date.getCategoriesName(), date.getCategoriesID()]),
          builder: (context, snapshot) {
            List<String> name = [];
            List<int> idd = [];
            name = date.categories_name;
            idd = date.categories_id;
            if (snapshot.hasData) {
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
                    shared(idd);
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
