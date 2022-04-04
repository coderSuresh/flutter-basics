// @dart=2.9
import 'package:flutter/material.dart';
import 'package:image_gallery/screens/home.dart';

import 'constants.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData.light().copyWith(
        primaryColor: kWhite,
        appBarTheme: const AppBarTheme(
          backgroundColor: kWhite,
          elevation: 0,
        ),
      ),
    );
  }
}
