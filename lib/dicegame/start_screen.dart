import 'package:bmi_calculate_app/dicegame/dice_game.dart';
import 'package:bmi_calculate_app/dicegame/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {
  static const String routeName = '/';

  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int? point;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Select Your initial points'),
            Consumer<GameProvider>(
              builder: (context, provider, _) => SizedBox(
                child: DropdownButton<int>(
                  value: point,
                  hint: Text('Select'),
                  items: provider.pointList.map(
                    (point) =>
                        DropdownMenuItem<int>(
                          value: point,
                            child: Text(point.toString())),
                  ).toList(),
                  onChanged: (value){
                    setState(() {
                      point = value;
                    });
                    provider.setInitialPoint(value!);
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if(point == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select a point')));
                  return;
                }

                Navigator.pushReplacementNamed(context, DiceGame.routeName);
              },
              child: Text('START GAME'),
            ),
          ],
        ),
      ),
    );
  }
}
