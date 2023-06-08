import 'package:flutter/material.dart';

class DrawerShoppingCart extends StatefulWidget {
  const DrawerShoppingCart({super.key});

  @override
  State<DrawerShoppingCart> createState() => _DrawerShoppingCartState();
}

class _DrawerShoppingCartState extends State<DrawerShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text(
                'Очистить корзину',
                style: TextStyle(fontSize: 22),
              ),
              onTap: (() {}),
            ),
            const Divider(
              height: 50,
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text(
                'Скидка',
                style: TextStyle(fontSize: 22),
              ),
              onTap: (() {}),
            ),
            const Spacer(),
            const Text('+38 097 770 9957'),
            const Text('info@selina.com.ua'),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
