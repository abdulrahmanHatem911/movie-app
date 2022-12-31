import 'package:flutter/material.dart';

import 'core/globel/theme/theme_data/dark_theme_data.dart';
import 'core/services/services_locator.dart';
import 'core/utills/app_string.dart';
import 'movie/presentaion/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppDarkTheme.darkThemeData,
      home: const MainMoviesScreen(),
    );
  }
}
