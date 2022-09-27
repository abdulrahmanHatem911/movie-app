import 'package:film/core/globel/theme/app_color/dark_app_color.dart';
import 'package:flutter/material.dart';

class AppDarkTheme {
  static ThemeData darkThemeData = ThemeData(
    appBarTheme: AppBarTheme(
      color: AppColorDark.appBarColor,
      elevation: 0,
    ),
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
