import 'package:flutter/material.dart';

class ThemeDataCustom {
  static light() {
    return ThemeData(
        fontFamily: 'JosefinsSans',
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF222222),
          onPrimary: Colors.white,
          secondary: Colors.deepPurple,
          onSecondary: Colors.white,
          error: Colors.deepPurple,
          onError: Colors.white,
          background: Colors.deepPurple,
          onBackground: Colors.white,
          surface: Colors.deepPurple,
          onSurface: Colors.black,
        ),
        drawerTheme: const DrawerThemeData(
          elevation: 0,
        ),
        errorColor: Colors.yellowAccent);
  }

  static dark() {
    return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.black87,
        onPrimary: Colors.white,
        secondary: Colors.black87,
        onSecondary: Colors.white,
        error: Colors.black87,
        onError: Colors.white,
        background: Colors.black87,
        onBackground: Colors.white,
        surface: Colors.black87,
        onSurface: Colors.white,
      ),
      drawerTheme: const DrawerThemeData(
        elevation: 0,
      ),
    );
  }
}
