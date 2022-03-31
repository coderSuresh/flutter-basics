import 'package:bestwidgets/routes.dart';
import 'package:bestwidgets/screens/home.dart';
import 'package:bestwidgets/screens/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyRoutes.login,
      routes: {
        MyRoutes.home: (context) => Home(),
        MyRoutes.login: (context) => const Login(),
      },
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.deepPurple.shade900,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.deepPurple.shade900,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple.shade900,
        ),
      ),
    );
  }
}
