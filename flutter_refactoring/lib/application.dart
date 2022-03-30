import 'package:flutter/material.dart';
import 'package:flutter_refactoring/custom/themeData.custom.dart';
import 'package:flutter_refactoring/widgets/scaffold.custom.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return _materialApp();
  }

  MaterialApp _materialApp() {
    return MaterialApp(
      title: 'Salão de Beleza',
      home: const ScaffoldCustom(),
      theme: ThemeDataCustom.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}
