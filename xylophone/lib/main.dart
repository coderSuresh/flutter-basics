import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("Xylophone"),
            backgroundColor: Colors.pink.shade900,
          ),
          body: Xylophone(),
        ),
      ),
    );
  }
}

class Xylophone extends StatelessWidget {
  const Xylophone({Key? key}) : super(key: key);

  Expanded buildKey(int noteNum, Color color) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          final player = AudioCache();
          player.play('note$noteNum.wav');
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(1, Colors.red),
          buildKey(2, Colors.orange),
          buildKey(3, Colors.yellow),
          buildKey(4, Colors.green),
          buildKey(5, Colors.teal),
          buildKey(6, Colors.blue),
          buildKey(7, Colors.purple)
        ],
      ),
    );
  }
}
