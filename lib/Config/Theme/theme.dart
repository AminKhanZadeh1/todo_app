import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    primaryColor: Colors.white,
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
    fontFamily: 'Cutta');

ThemeData darkMode = ThemeData(
    primaryColor: Colors.grey[900],
    drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[900]),
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
    fontFamily: 'Cutta');
