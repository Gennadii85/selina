import 'package:flutter/material.dart';

class ShowDialogRegistration extends StatelessWidget {
  const ShowDialogRegistration(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.blue.shade50),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK')),
      ],
    );
  }
}
