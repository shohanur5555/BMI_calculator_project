import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bmi/bmi_page.dart';
import 'bmi/bmi_provider.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => BmiProvider()),
          ],
          child: const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const BmiPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

