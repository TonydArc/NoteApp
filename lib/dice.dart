import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int dicenumber = 1;

  void randomDice() {
    setState(() {
      dicenumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.deepPurple),
      child: GestureDetector(
          onTap: () {
            randomDice();
          },
          child: Image.asset('assets/dice$dicenumber.png')),
    );
  }
}
