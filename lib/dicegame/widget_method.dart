import 'package:flutter/material.dart';

showStatusDialog(
{
  required BuildContext context,
  required String title,
  required String image,
  required String massage,
  required int diceSum,
  required VoidCallback onContinueButtonPressed,
}
)
{
  showDialog(barrierDismissible: false, context: context, builder: (context) => AlertDialog(
    title: Text(title),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Your scored : $diceSum'),
        Text(massage, style: TextStyle(fontSize: 18.0),),
        Image.asset(image, height: 250, width: 150, fit: BoxFit.contain,)
      ],
    ),
    actions: [
      OutlinedButton(onPressed: () {
        Navigator.pop(context);
        onContinueButtonPressed();
      }, child: Text('CONTINEU')),
    ],
  ));
}