import 'dart:math';


import 'package:bmi_calculate_app/dicegame/widget_method.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game_provider.dart';

class DiceGame extends StatefulWidget {
  static const String routeName ='/game';
  const DiceGame({super.key});

  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Game', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      ),
      body: Consumer<GameProvider>(
        builder: (context, provider, _) => Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Your Point ${provider.totalPoint}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  provider.diceOneImage,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 15.0),
                Image.asset(
                  provider.diceTwoImage,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 11,),
            Text(
              'Dice Sum : ${provider.diceSum}',
              style: TextStyle(fontSize: 20),
            ),
            if (provider.terget > 0 && !provider.isGameOver)
              Text(
                'Your New Target : ${provider.terget}',
                style: TextStyle(fontSize: 20),
              ),
            if (provider.terget > 0 && !provider.isGameOver)
              Text(
                'Keep rolling until match it : ${provider.terget}',
                style: TextStyle(fontSize: 18,color: Colors.grey),

              ),
            Text(provider.status, style: TextStyle(fontSize: 24)),
            Spacer(),
            if (!provider.isGameOver)
              ElevatedButton(
                onPressed: (){
                             provider.rollTheDice();
                             if(provider.winingStatus != GameStatus.none){
                               final title = provider.winingStatus == GameStatus.win ? 'WINNER' : 'LOSER';
                               final image = provider.winingStatus == GameStatus.win ? 'assets/dice_image/trophy.png' : 'assets/dice_image/lose.png';
                               final canPlay = provider.canPlayerPlay;
                               final _msg = provider.winingStatus == GameStatus.win ? 'You are won ${provider.winingPoint}' : 'You are losing ${provider.losingPoint}';
                               showStatusDialog(context: context, title: title, image: image, massage: _msg, onContinueButtonPressed: (){
                                 if(canPlay){
                                   provider.resetGame();
                                 }else{
                                   Navigator.pop(context);
                                 }
                               }, diceSum: provider.diceSum);
                             }
                         },
                child: Text('Roll The Dice'),
              ),
            if (provider.isGameOver)
              ElevatedButton(
                onPressed: provider.resetGame,
                child: Text('RESET'),
              ),
          ],
        ),
      ),
    );
  }
}
