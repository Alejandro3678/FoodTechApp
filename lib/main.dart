import 'package:flutter/material.dart';
import 'package:food_tech_app/pantallas/pantalla_inicio.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Daniel Alejandro  - Grupo #3 Tecnicas de calidad \nde software'),
        ),
      ),
    );
  }
}
