import 'package:flutter/material.dart';

class CardChild extends StatelessWidget {
  final String text;
  final IconData icon;

  CardChild({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(
          text,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
