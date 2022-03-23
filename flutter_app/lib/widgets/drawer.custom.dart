import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _listTileCustom(context, 'Home', Icons.home, '/'),
          _listTileCustom(context, 'Clientes', Icons.person, '/clients'),
        ],
      ),
    );
  }

  _listTileCustom(
      BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
