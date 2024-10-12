import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/ofertas/seccion_cuerpo_ofertas.dart';

class PantallaOfertas extends StatelessWidget {
  const PantallaOfertas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SeccionCuerpoOfertas(),
    );
  }
}