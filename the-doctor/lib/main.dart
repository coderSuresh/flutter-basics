import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Text("The Doctor"),
        backgroundColor: Colors.deepPurple[800],
      ),
      body: Center(
        child: CircleAvatar(
          foregroundImage: AssetImage('images/doctor.jpg'),
          radius: 150,
        ),
      ),
    ),
  ));
}
