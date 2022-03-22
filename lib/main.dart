import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          title: const Text('Dice on Flutter'),
          backgroundColor: Colors.cyanAccent,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = Random().nextInt(6) + 1;
  int rightDiceNumber = Random().nextInt(6) + 1;

  void onDiceButton(String type) {
    if (type == 'left') {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
      });
    } else {
      setState(() {
        rightDiceNumber = Random().nextInt(6) + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                onDiceButton('left');
              },
              child: Image(
                image: AssetImage('images/dice$leftDiceNumber.png'),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                onDiceButton('right');
              },
              child: Image(
                image: AssetImage('images/dice$rightDiceNumber.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
