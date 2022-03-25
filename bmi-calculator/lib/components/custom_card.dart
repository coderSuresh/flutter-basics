import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({required this.colour, required this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: cardChild,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(7.0),
      ),
    );
  }
}
