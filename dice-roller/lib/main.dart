import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(DiceRoller());
}

class DiceRoller extends StatelessWidget {
  const DiceRoller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple[900],
        appBar: AppBar(
          title: Text("Dice Roller"),
          backgroundColor: Colors.deepPurple[800],
        ),
        body: MainBody(),
      ),
    );
  }
}

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  int ldn = 1;
  int rdn = 1;

  void changeDiceNum() {
    ldn = Random().nextInt(6) + 1;
    rdn = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: [
        Expanded(
          child: TextButton(
            child: Image.asset('images/dice$ldn.png'),
            onPressed: () {
              setState(() {
                changeDiceNum();
              });
            },
          ),
        ),
        Expanded(
          child: TextButton(
            child: Image.asset('images/dice$rdn.png'),
            onPressed: () {
              setState(() {
                changeDiceNum();
              });
            },
          ),
        ),
      ]),
    );
  }
}
