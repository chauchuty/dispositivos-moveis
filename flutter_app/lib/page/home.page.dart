import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/scaffold.custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldCustom(
      appBarTitle: 'Home',
    );
  }
}