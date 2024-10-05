import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/categoria/seccion_cuerpo_categoria.dart';

class PantallaCategorias extends StatelessWidget {
  const PantallaCategorias({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SeccionCuerpoCategoria(),
    );
  }
}
