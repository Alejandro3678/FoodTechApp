import 'package:flutter/material.dart';
import 'package:food_tech_app/widgets/componentes/app_bar_base.dart';
import 'package:food_tech_app/widgets/componentes/bottom_navigation_bar_base.dart';

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BarraNavegacionSuperior(),
      body: Center(
        child: SafeArea(
          child: Text(
            "HOLA MUNDO",
            style: TextStyle(fontSize: 48),
          ),
        ),
      ),
      bottomNavigationBar: BarraNavegacionInferior(),
    );
  }
}
