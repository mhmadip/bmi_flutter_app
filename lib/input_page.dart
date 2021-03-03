import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum GenderType {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 19;
  var selectedGender;

  var selectedMaleColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      colour: selectedGender == GenderType.male
                          ? kActiveCardColor
                          : KInActiveCardColor,
                      cardChild: ReusableColumn(
                        "MALE",
                        FontAwesomeIcons.male,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      colour: selectedGender == GenderType.female
                          ? kActiveCardColor
                          : KInActiveCardColor,
                      cardChild: ReusableColumn(
                        "FEMALE",
                        FontAwesomeIcons.female,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: kTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: kTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29EB1555),
                          inactiveTrackColor: Color(0xFF8d8e98)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                          print(newValue);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: kTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
                buttonTitle: "CALCULATE",
                onTap: () {
                  CalculatorBrain cal =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPages(
                              bmiResult: cal.calculateBMI(),
                              interpretation: cal.getInterpretation(),
                              resultText: cal.getResult(),
                            )),
                  );
                }),
          ],
        ));
  }
}
