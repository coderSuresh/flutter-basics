import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;
  RoundIconButton({required this.icon, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      fillColor: kRoundButtonColor,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        height: 45,
        width: 45,
      ),
    );
  }
}
