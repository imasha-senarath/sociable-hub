import 'package:flutter/material.dart';

void showMessage(String msg, BuildContext context) {
  showDialog(context: context, builder: (context) =>AlertDialog(
    title: Text(msg),
  ));
}
