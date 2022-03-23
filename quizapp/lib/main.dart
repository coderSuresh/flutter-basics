import 'package:flutter/material.dart';
import 'package:quizapp/QuizHandler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizHandler quizHandler = QuizHandler();

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Quiz App"),
          backgroundColor: Colors.blue.shade900,
        ),
        body: Quiz(),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> scoreKeeper = [];

  void checkAns(bool userAns) {
    bool correctAns = quizHandler.getAnswer();
    setState(() {
      if (quizHandler.isFinished() == true) {
        Alert(
          context: context,
          desc: "You have reached the end of the quiz.",
          title: "Completed!",
        ).show();
        scoreKeeper = [];
        quizHandler.reset();
      } else {
        if (correctAns == userAns) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green.shade900,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red.shade900,
          ));
        }
        quizHandler.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  quizHandler.getQuestion(),
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  fixedSize: Size.fromHeight(10),
                ),
                onPressed: () {
                  checkAns(true);
                },
                child: Text(
                  "True",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red.shade900,
                ),
                onPressed: () {
                  checkAns(false);
                },
                child: Text(
                  "False",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
