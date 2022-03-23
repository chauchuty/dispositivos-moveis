import 'package:flutter/material.dart';

class ThemeDataCustom {
  static feature() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.red[800],
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.grey[850],
      ),
      listTileTheme: const ListTileThemeData(
        textColor: Colors.white,
        iconColor: Colors.white,
      ),
    );
  }
}
