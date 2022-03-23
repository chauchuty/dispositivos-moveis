import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/appBar.custom.dart';
import 'package:flutter_app/widgets/drawer.custom.dart';

class ScaffoldCustom extends StatelessWidget {
  final String appBarTitle;

  const ScaffoldCustom({
    Key? key,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: appBarTitle,
      ),
      drawer: DrawerCustom(),
    );
  }
}
