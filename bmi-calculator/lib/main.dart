import 'package:flutter/material.dart';
import 'screen/home.dart';

void main() => runApp(BmiApp());

class BmiApp extends StatelessWidget {
  const BmiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        //customize here
        scaffoldBackgroundColor: Color(0xff0a0e21),
        appBarTheme: AppBarTheme().copyWith(backgroundColor: Color(0xff0a0e21)),
      ),
      home: HomePage(),
    );
  }
}
