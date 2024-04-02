import 'package:flutter/material.dart';

void showMessage(String msg, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(msg),
          ));
}

void showConfirmDialog(
    String title, String des, Function() onConfirm, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(des),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'No',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.red,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop();
          },
          child: const Text(
            'Yes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    ),
  );
}
