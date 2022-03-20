import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo[100],
      body: const Center(
        child: Image(
          image: NetworkImage('https://source.unsplash.com/600x600?cat'),
        ),
      ),
      appBar: AppBar(
        title: const Text("Flutter App"),
        backgroundColor: Colors.indigo[900],
      ),
    ),
  ));
}
