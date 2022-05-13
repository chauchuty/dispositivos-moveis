import 'package:flutter/material.dart';

class SnackBarCustom extends StatelessWidget {
  final String message;
  const SnackBarCustom({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: const Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
  }
}
