import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ClickHandler extends StatelessWidget {
  final String btnText;
  final VoidCallback onClick;

  ClickHandler({required this.btnText, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        width: double.infinity,
        height: kButtonHeight,
        margin: EdgeInsets.only(top: 10.0),
        color: kButtonBg,
      ),
    );
  }
}
