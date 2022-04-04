import 'package:flutter/material.dart';
import 'home_body.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Gallery",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: const HomePage(),
    );
  }
}
