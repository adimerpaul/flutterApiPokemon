import 'package:flutter/material.dart';
import 'package:prueba2/home_screen.dart';

void main() {
  runApp(Pokedex());
}
class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen()
    );
  }
}