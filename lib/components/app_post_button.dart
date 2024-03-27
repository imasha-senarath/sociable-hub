import 'package:flutter/material.dart';

class AppPostButton extends StatelessWidget {
  final void Function() onTap;

  const AppPostButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Icon(
            Icons.done,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
