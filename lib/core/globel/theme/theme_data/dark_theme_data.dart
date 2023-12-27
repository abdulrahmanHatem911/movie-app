import 'package:flutter/material.dart';

import '../app_color/dark_app_color.dart';

class AppDarkTheme {
  static ThemeData darkThemeData = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(color: AppColorDark.appBarColor, elevation: 0),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColorDark.scaffoldColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColorDark.scaffoldColor,
      selectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      selectedLabelStyle: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    ),
    //textTheme: getTextTheme,
  );
  static TextTheme getTextTheme = const TextTheme(
    displayLarge: TextStyle(
      color: AppColorDark.displayLargeColor,
    ),
  );
}
