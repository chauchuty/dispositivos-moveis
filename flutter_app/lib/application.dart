import 'package:flutter/material.dart';
import 'package:flutter_app/custom/themeData.custom.dart';
import 'package:flutter_app/routes/routes.custom.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RoutesCustom.initialRoute,
      onGenerateRoute: (settings) {
        return RoutesCustom.routes(settings);
      },
      theme: ThemeDataCustom.feature(),
      debugShowCheckedModeBanner: false,
    );
  }
}
