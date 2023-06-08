import 'package:flutter/material.dart';

import '../home_page/drawer_app_bar.dart';
import '../sample/model_categories.dart';
import 'categories.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerAppBar(),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(image: AssetImage('assets/baner.jpeg')),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Categories(
                    name: 'подвески',
                    image: 'assets/podveski.png',
                    coolbackCategories: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ModelCategories()));
                    },
                  ),
                ),
                Expanded(
                  child: Categories(
                    name: 'браслеты',
                    image: 'assets/braslety.png',
                    coolbackCategories: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ModelCategories()));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Categories(
                    name: 'сережки',
                    image: 'assets/sergi.png',
                    coolbackCategories: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ModelCategories()));
                    },
                  ),
                ),
                Expanded(
                  child: Categories(
                    name: 'кольца',
                    image: 'assets/kolca.png',
                    coolbackCategories: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ModelCategories()));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Categories(
                    name: 'резинки',
                    image: 'assets/rezinki.png',
                    coolbackCategories: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ModelCategories()));
                    },
                  ),
                ),
                Expanded(
                  child: Categories(
                    name: 'заколки',
                    image: 'assets/zakolki.png',
                    coolbackCategories: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ModelCategories()));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Categories(
                    name: 'обручи',
                    image: 'assets/obodki.png',
                    coolbackCategories: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ModelCategories()));
                    },
                  ),
                ),
                Expanded(
                  child: Categories(
                    name: 'сталь',
                    image: 'assets/stal.png',
                    coolbackCategories: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ModelCategories()));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Categories(
                    name: 'ювелирные',
                    image: 'assets/yuvelir.png',
                    coolbackCategories: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ModelCategories()));
                    },
                  ),
                ),
                Expanded(
                  child: Categories(
                    name: 'другое',
                    image: 'assets/drugoe.png',
                    coolbackCategories: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ModelCategories()));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
