import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showStatusDialog(
{
  required BuildContext context,
  required String title,
  required String image,
  required String massage,
  bool canPlay = true,
}
)
{
  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text(title),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(massage, style: TextStyle(fontSize: 18.0),),
        Image.asset(image, height: 250, width: double.infinity, fit: BoxFit.cover,)
      ],
    ),
    actions: [
      OutlinedButton(onPressed: () {}, child: Text('CONTINEU')),
    ],
  ));
}