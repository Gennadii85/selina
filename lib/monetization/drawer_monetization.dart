import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DrawerMonetization extends StatefulWidget {
  const DrawerMonetization({super.key});

  @override
  State<DrawerMonetization> createState() => _DrawerMonetizationState();
}

class _DrawerMonetizationState extends State<DrawerMonetization> {
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
                'Отправить заказ',
                style: TextStyle(fontSize: 22),
              ),
              onTap: (() {}),
            ),
            ListTile(
              title: const Text(
                'История заказов',
                style: TextStyle(fontSize: 22),
              ),
              onTap: (() {}),
            ),
            ListTile(
              title: const Text('Коментарии', style: TextStyle(fontSize: 22)),
              onTap: (() {}),
            ),
            ListTile(
              title: const Text(
                'Выйти из акаунта',
                style: TextStyle(fontSize: 22),
              ),
              onTap: (() {
                Hive.box('user').clear();
              }),
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
