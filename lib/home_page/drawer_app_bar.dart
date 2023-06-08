import 'package:flutter/material.dart';

class DrawerAppBar extends StatelessWidget {
  const DrawerAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: const Text(
                'Каталог',
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ),
              leading: const Icon(Icons.home),
              onTap: (() {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => const TodoList()));
              }),
            ),
            ListTile(
              title: const Text(
                'Розпродажа',
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ),
              leading: const Icon(Icons.water),
              onTap: (() {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => const Water()));
              }),
            ),
            ListTile(
              title: const Text(
                'Новинки',
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ),
              leading: const Icon(Icons.light_mode),
              onTap: (() {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const WeatherScreen()));
              }),
            ),
            ListTile(
              title: const Text(
                'Акции',
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ),
              leading: const Icon(Icons.settings),
              onTap: (() {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => const Settings()));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
