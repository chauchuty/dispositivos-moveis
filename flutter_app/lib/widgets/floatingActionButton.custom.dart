import 'package:flutter/material.dart';

class FloatingActionButtonCustom {
  static feature(context, widget) {
    return FloatingActionButton(
      tooltip: 'Novo Cliente',
      child: const Icon(Icons.person_add),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget,
            ));
      },
    );
  }
}
