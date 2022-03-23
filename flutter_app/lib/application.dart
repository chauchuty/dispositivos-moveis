import 'package:flutter/material.dart';
import 'package:flutter_app/page/home.page.dart';
import 'package:flutter_app/widgets/scaffold.custom.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
