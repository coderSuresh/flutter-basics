import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:randomquote/constants.dart';
import 'package:randomquote/quote_content.dart';

class QuoteLogic extends StatefulWidget {
  const QuoteLogic({Key? key}) : super(key: key);

  @override
  State<QuoteLogic> createState() => _QuoteLogicState();
}

class _QuoteLogicState extends State<QuoteLogic> {
  Future<QuoteContent> fetchData() async {
    final response =
        await http.get(Uri.parse('https://api.adviceslip.com/advice'));

    if (response.statusCode == 200) {
      return QuoteContent.fromJson(jsonDecode(response.body)['slip']);
    } else {
      throw Exception("Something went wrong");
    }
  }

  late Future<QuoteContent> myFuture;

  @override
  void initState() {
    super.initState();
    myFuture = fetchData();
  }

  void generateQuote() {
    myFuture = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Container(
            alignment: Alignment.center,
            child: Card(
              color: kCardBackground,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FutureBuilder<QuoteContent>(
                  future: myFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.quote,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, color: kTextColorLite),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 15),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: kButtonBackground,
              ),
              onPressed: () {
                setState(() {
                  generateQuote();
                });
              },
              child: Text(
                "GENERATE",
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
