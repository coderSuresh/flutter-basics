import 'package:flutter/material.dart';
import 'package:randomquote/quote_logic.dart';
import 'package:randomquote/constants.dart';

void main() => runApp(QuoteApp());

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
      //customize theme
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kBackgroundColor,
          appBarTheme:
              AppBarTheme().copyWith(backgroundColor: kAppBarBackground)),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Random Quote".toUpperCase(),
          style: TextStyle(
            color: kTextColor,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: QuoteLogic(),
    );
  }
}
