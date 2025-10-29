import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({required this.path, super.key});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(path, height: double.infinity, width: double.infinity, fit: BoxFit.cover,);
  }
}
