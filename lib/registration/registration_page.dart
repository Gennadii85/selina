import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:selina/registration/show_dialog_registration.dart';

import '../home_page/my_home_page.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}
/*
данные регистрации клиента лежат в Hive.box('user')
имя клиента по ключу "userName"
телефон клиента по ключу "userName"
*/

class _RegistrationState extends State<Registration> {
  TextEditingController nameRegistrationController = TextEditingController();
  TextEditingController phoneRegistrationController = TextEditingController();
  var userBoxRegistration = Hive.box('user');

  Future openBox() async {
    await Hive.openBox('user');
  }

  @override
  void initState() {
    openBox();
    super.initState();
  }

  checkNameForm() {
    if (nameRegistrationController.text.isNotEmpty) {
      userBoxRegistration.put('userName', nameRegistrationController.text);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Введите имя'),
              actions: [
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue.shade50),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK')),
              ],
            );
          });
    }
  }

  checkPhoneForm() {
    if (int.tryParse(phoneRegistrationController.text) != null) {
      if (phoneRegistrationController.text.length == 9) {
        userBoxRegistration.put('userPhone', phoneRegistrationController.text);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const MyHomePage()));
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const ShowDialogRegistration('Номер введен не правильно');
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const ShowDialogRegistration('Введите номер телефона');
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Регистрация нового клиента'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Column(
                children: [
                  const Text('Для оформления заказа нужно пройти регистраию.',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  const SizedBox(height: 40),
                  TextField(
                    controller: nameRegistrationController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: 'как к вам обращаться'),
                  ),
                  // const SizedBox(height: 40),
                  TextField(
                    controller: phoneRegistrationController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefix: Text('+380'),
                        counterText: 'укажите контактный номер телефона'),
                  ),
                  // const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue.shade50),
                          onPressed: () {
                            openBox();
                            checkNameForm();
                            checkPhoneForm();
                            // print(userBoxRegistration.values);
                          },
                          child: const Text('Регистрация'))
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
