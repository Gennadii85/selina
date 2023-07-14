// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_page/drawer_home_page.dart';
import '../sample/model_categories.dart';
import '../date_base/categories_date.dart';
import 'categories.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => CategoriesPageState();
}

class CategoriesPageState extends State<CategoriesPage> {
  Future shared(id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('id_categories');
    await prefs.setInt('id_categories', id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerAppBar(),
      appBar: AppBar(
        title: const Text('Selina'),
      ),
      body: FutureBuilder<List<CategoriesDate>>(
          future: CategoriesDate.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                padding: const EdgeInsets.all(5),
                itemBuilder: (BuildContext context, int index) => Categories(
                  image: snapshot.data![index].cat_icon,
                  name: snapshot.data![index].cat_name.toString(),
                  id: snapshot.data![index].cat_id,
                  coolbackCategories: (id) {
                    shared(id);
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
