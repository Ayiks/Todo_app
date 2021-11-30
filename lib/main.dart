import 'package:flutter/material.dart';
import 'package:todo_app/utils.dart';

import 'home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        appBarTheme:  AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: customBlue),
          titleTextStyle: TextStyle(
            color: customBlue,
            fontWeight: FontWeight.w600,
            fontSize: 25
          ),
        ),
      ),
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25
            )),
      ),
      themeMode: ThemeMode.light,
      home: HomeView(),
    );
  }
}
