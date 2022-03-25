import 'package:bmi_calculator/components/click_handler.dart';
import 'package:bmi_calculator/components/custom_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  final String result;
  final String summary;
  final String bmi;

  BMIResult({required this.bmi, required this.result, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomContainer(
              colour: kinActiveCardBg,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      summary,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ClickHandler(
            btnText: "RE-CALCULATE",
            onClick: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
