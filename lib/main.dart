import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'bmi/bmi_page.dart';
import 'bmi/bmi_provider.dart';
import 'dicegame/dice_game.dart';
import 'dicegame/game_provider.dart';
import 'dicegame/my_account.dart';
import 'dicegame/start_screen.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => BmiProvider()),
            ChangeNotifierProvider(create: (context) => GameProvider()),
          ],
          child: const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
        textTheme: GoogleFonts.pressStart2pTextTheme().apply(
          displayColor: Colors.white,
          bodyColor: Colors.white,
        ),
      ),
      initialRoute: StartScreen.routeName,
      routes: {
        StartScreen.routeName : (context) => const StartScreen(),
        MyAccountScreen.routeName : (context) => const MyAccountScreen(),
        DiceGame.routeName : (context) => const DiceGame(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

