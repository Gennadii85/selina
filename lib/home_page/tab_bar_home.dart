import 'package:flutter/material.dart';

import '../categories/categories_page.dart';
import '../monetization/monetization_page.dart';
import '../shopping_cart/shopping_cart_page.dart';

class TabBarHome extends StatefulWidget {
  const TabBarHome({super.key});

  @override
  State<TabBarHome> createState() => _TabBarHomeState();
}

class _TabBarHomeState extends State<TabBarHome> {
  int index = 0;
  final tabBarScreens = [
    const CategoriesPage(),
    const ShoppingCartPage(),
    const MonetizationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabBarScreens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            backgroundColor: Colors.amber.shade100,
            indicatorColor: Colors.pink.shade100),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          height: 50,
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.list_alt_outlined), label: 'Каталог'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Кошик'),
            NavigationDestination(
                icon: Icon(Icons.monetization_on_outlined), label: 'Замовити'),
          ],
        ),
      ),
    );
  }
}
