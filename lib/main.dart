import 'package:film/core/globel/theme/theme_data/dark_theme_data.dart';
import 'package:film/core/services/services_locator.dart';
import 'package:film/core/utills/app_string.dart';
import 'package:film/movie/presentaion/screens/movies_screen.dart';
import 'package:flutter/material.dart';

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
