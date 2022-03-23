import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/scaffold.custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarTitle: 'Hair Salon',
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
        ),
      ),
    );
  }
}
