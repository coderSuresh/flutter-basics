import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/screen/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/click_handler.dart';
import '../components/custom_card.dart';
import '../components/card_child.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';

//enum for gender
enum Gender {
  male,
  female,
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Gender? gender;
  int height = 180;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  child: CustomContainer(
                    colour:
                        gender == Gender.male ? kActiveCardBg : kinActiveCardBg,
                    cardChild:
                        CardChild(text: "Male", icon: FontAwesomeIcons.mars),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  child: CustomContainer(
                    colour: gender == Gender.female
                        ? kActiveCardBg
                        : kinActiveCardBg,
                    cardChild:
                        CardChild(text: "Female", icon: FontAwesomeIcons.venus),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: CustomContainer(
            colour: kinActiveCardBg,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("HEIGHT"),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kBigText,
                    ),
                    Text(
                      "cm",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: kSliderActiveColor,
                    inactiveTrackColor: kSliderInactiveColor,
                    overlayColor: kOverlayColor,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    thumbColor: kButtonBg,
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 80,
                    max: 300,
                    onChanged: (double val) {
                      setState(() {
                        height = val.round();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: CustomContainer(
                  colour: kinActiveCardBg,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT"),
                      Text(
                        weight.toString(),
                        style: kBigText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(width: 20),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomContainer(
                  colour: kinActiveCardBg,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE"),
                      Text(
                        age.toString(),
                        style: kBigText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(width: 20),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ClickHandler(
          btnText: "CALCULATE",
          onClick: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  Calculator cal = Calculator(height: height, weight: weight);
                  return BMIResult(
                    bmi: cal.calculate(),
                    result: cal.getResult(),
                    summary: cal.getSummary(),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
