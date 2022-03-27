import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Colors.indigo,
        ),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  String answer = "0";
  String expression = "";
  double equationFontSize = 20.0;
  double answerFontSize = 30.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        equation = "0";
        answer = "0";
        equationFontSize = 20.0;
        answerFontSize = 30.0;
      } else if (buttonText == "C") {
        equationFontSize = 30.0;
        answerFontSize = 20.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 20.0;
        answerFontSize = 30.0;
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression ex = p.parse(expression);
          ContextModel cm = ContextModel();
          answer = '${ex.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          answer = "Error";
        }
      } else {
        equationFontSize = 30.0;
        answerFontSize = 20.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget ButtonBuilder(
      {required String text, required Color color, required double height}) {
    return Container(
      margin: EdgeInsets.all(2),
      height: MediaQuery.of(context).size.height * height,
      color: color,
      child: TextButton(
        onPressed: () {
          buttonPressed(text);
        },
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerRight,
            child: Text(equation, style: TextStyle(fontSize: equationFontSize)),
          ),
          Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.15,
                right: 10,
                top: 10),
            alignment: Alignment.centerRight,
            child: Text(answer, style: TextStyle(fontSize: answerFontSize)),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        ButtonBuilder(
                            text: "AC",
                            color: Colors.purple.shade900,
                            height: 0.1),
                        ButtonBuilder(
                            text: "C", color: Colors.indigo, height: 0.1),
                        ButtonBuilder(
                            text: "+", color: Colors.indigo, height: 0.1),
                      ],
                    ),
                    TableRow(
                      children: [
                        ButtonBuilder(
                            text: "7", color: Colors.blueGrey, height: 0.1),
                        ButtonBuilder(
                            text: "8", color: Colors.blueGrey, height: 0.1),
                        ButtonBuilder(
                            text: "9", color: Colors.blueGrey, height: 0.1),
                      ],
                    ),
                    TableRow(
                      children: [
                        ButtonBuilder(
                            text: "4", color: Colors.blueGrey, height: 0.1),
                        ButtonBuilder(
                            text: "5", color: Colors.blueGrey, height: 0.1),
                        ButtonBuilder(
                            text: "6", color: Colors.blueGrey, height: 0.1),
                      ],
                    ),
                    TableRow(
                      children: [
                        ButtonBuilder(
                            text: "1", color: Colors.blueGrey, height: 0.1),
                        ButtonBuilder(
                            text: "2", color: Colors.blueGrey, height: 0.1),
                        ButtonBuilder(
                            text: "3", color: Colors.blueGrey, height: 0.1),
                      ],
                    ),
                    TableRow(
                      children: [
                        ButtonBuilder(
                            text: ".", color: Colors.blueGrey, height: 0.1),
                        ButtonBuilder(
                            text: "0", color: Colors.blueGrey, height: 0.1),
                        ButtonBuilder(
                            text: "00", color: Colors.blueGrey, height: 0.1),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        ButtonBuilder(
                            text: "-", color: Colors.indigo, height: 0.1),
                      ],
                    ),
                    TableRow(
                      children: [
                        ButtonBuilder(
                            text: "x", color: Colors.indigo, height: 0.1),
                      ],
                    ),
                    TableRow(
                      children: [
                        ButtonBuilder(
                            text: "÷", color: Colors.indigo, height: 0.1),
                      ],
                    ),
                    TableRow(
                      children: [
                        ButtonBuilder(
                            text: "=",
                            color: Colors.purple.shade900,
                            height: 0.205),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
