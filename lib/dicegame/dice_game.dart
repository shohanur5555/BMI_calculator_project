import 'dart:math';

import 'package:flutter/material.dart';

class DiceGame extends StatefulWidget {
  const DiceGame({super.key});

  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  final _diceList = [
    'assets/dice_image/d1.png',
    'assets/dice_image/d2.png',
    'assets/dice_image/d3.png',
    'assets/dice_image/d4.png',
    'assets/dice_image/d5.png',
    'assets/dice_image/d6.png',

  ];
  int _index1 = 0;
  int _index2 = 0;
  final _random = Random();

  rollTheDice (){
    setState(() {
      _index1 = _random.nextInt(6);
      _index2 = _random.nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Dice Game', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(_diceList[_index1], width: 100,fit: BoxFit.cover,),
              SizedBox(width: 15.0,),
              Image.asset(_diceList[_index2], width: 100,fit: BoxFit.cover,),
            ],
          ),
          ElevatedButton(onPressed: rollTheDice, child: Text('Roll The Dice')),


        ],
      ),
    );
  }
}
